/**
 * 空気清浄機フィルターの品番・画像を楽天から発掘する（使い捨て）。
 * 対象モデルは migration 0007 の INSERT 文から取得（DB 非依存）。
 *
 *   pnpm tsx scripts/discover-air-purifier-parts.ts
 *
 * 出力: stdout に JSON（モデル別の候補品番 + 代表画像）、stderr に進行ログ。
 */

import { config } from "dotenv";
import { readFileSync } from "node:fs";
import { resolve } from "node:path";

config({ path: resolve(process.cwd(), ".env.local"), quiet: true });

// 0007 の VALUES 行から (manufacturer, model_number) を抽出
function loadModels(): { manufacturer: string; model_number: string }[] {
  const sql = readFileSync(
    resolve(process.cwd(), "supabase/migrations/0007_seed_air_purifiers.sql"),
    "utf8",
  );
  const re = /\('([^']+)',\s*'air_purifier',\s*'([^']+)',\s*true\)/g;
  const out: { manufacturer: string; model_number: string }[] = [];
  let m: RegExpExecArray | null = re.exec(sql);
  while (m) {
    out.push({ manufacturer: m[1], model_number: m[2] });
    m = re.exec(sql);
  }
  return out;
}

// フィルター品番パターン（メーカー純正品番）
const PART_PATTERNS: RegExp[] = [
  /\bFZ-[A-Z0-9]{3,9}\b/gi, // シャープ FZ-D50HF / FZ-Y80MF / FZ-AG01K1 / FZ-PF51F1
  /\bF-Z[A-Z]{2,3}[0-9]{2,3}\b/gi, // Panasonic F-ZXLP90 / F-ZXJV90 / F-ZXLD90 / F-ZXJP50
  /\bKAF[A-Z]?[0-9]{3}[A-Z][0-9]\b/gi, // ダイキン KAFP029A4 / KAFP085A4
  /\bEPF-[A-Z0-9]{4,14}\b/gi, // 日立 EPF-MVG90H / EPF-KVG900KF001
  /\bFL-C[0-9]{2,3}\b/gi, // cado FL-C320 / FL-C130
  /\bEJT-S[0-9]{3}\b/gi, // バルミューダ EJT-S200
];

interface RakutenItem {
  itemName?: string;
  mediumImageUrls?: Array<{ imageUrl: string } | string>;
}

async function searchRakuten(keyword: string): Promise<RakutenItem[]> {
  const appId = process.env.RAKUTEN_APP_ID!;
  const accessKey = process.env.RAKUTEN_ACCESS_KEY!;
  const origin = process.env.RAKUTEN_ORIGIN ?? "http://example.com";
  const params = new URLSearchParams({
    applicationId: appId,
    keyword,
    hits: "15",
    formatVersion: "2",
    availability: "1",
  });
  const url = `https://openapi.rakuten.co.jp/ichibams/api/IchibaItem/Search/20260401?${params}`;
  const res = await fetch(url, { headers: { accessKey, Origin: origin, Referer: `${origin}/` } });
  if (!res.ok) {
    console.error(`  rakuten ${res.status} for "${keyword}"`);
    return [];
  }
  const json = (await res.json()) as { Items?: RakutenItem[] };
  return json.Items ?? [];
}

interface Result {
  manufacturer: string;
  model_number: string;
  candidates: { part_number: string; count: number }[];
  top_image_url: string | null;
}

async function main() {
  const onlyMfg = process.env.ONLY_MFG;
  let models = loadModels();
  if (onlyMfg) models = models.filter((m) => m.manufacturer === onlyMfg);
  console.error(`Loaded ${models.length} air-purifier models from 0007.`);
  const results: Result[] = [];

  for (const model of models) {
    const keyword = `${model.model_number} フィルター`;
    console.error(`[query] ${keyword}`);
    const items = await searchRakuten(keyword);
    const counts = new Map<string, number>();
    let topImage: string | null = null;
    for (const it of items) {
      const title = it.itemName ?? "";
      for (const pat of PART_PATTERNS) {
        pat.lastIndex = 0;
        let m: RegExpExecArray | null = pat.exec(title);
        while (m) {
          const pn = m[0].toUpperCase();
          counts.set(pn, (counts.get(pn) ?? 0) + 1);
          m = pat.exec(title);
        }
      }
      if (!topImage) {
        const first = it.mediumImageUrls?.[0];
        if (first) topImage = typeof first === "string" ? first : first.imageUrl;
      }
    }
    const candidates = [...counts.entries()]
      .map(([part_number, count]) => ({ part_number, count }))
      .sort((a, b) => b.count - a.count)
      .slice(0, 6);
    results.push({ ...model, candidates, top_image_url: topImage });
    await new Promise((r) => setTimeout(r, 1300));
  }

  console.log(JSON.stringify(results, null, 2));
  console.error(`\nDone. ${results.length} models processed.`);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
