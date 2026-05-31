/**
 * 空気清浄機フィルター parts の画像補完 + Panasonic 50クラス加湿フィルター調査（使い捨て）。
 * 対象品番は migration 0008 の manufacturer_part_number から抽出（DB 非依存）。
 *
 *   pnpm tsx scripts/enrich-air-purifier-images.ts
 *
 * 出力: stdout に JSON { images: [{mpn, image_url}], panaHumid: [...] }
 */

import { config } from "dotenv";
import { readFileSync } from "node:fs";
import { resolve } from "node:path";

config({ path: resolve(process.cwd(), ".env.local"), quiet: true });

function loadMpns(): string[] {
  const sql = readFileSync(
    resolve(process.cwd(), "supabase/migrations/0008_seed_air_purifier_parts.sql"),
    "utf8",
  );
  const re = /'air_purifier'.*?|values \('[^']+', 'filter|other', 'oem', '[^']+', '([^']+)'\)/g;
  // 単純に manufacturer_part_number（values の 5 番目）を拾う
  const re2 = /values \('[^']+',\s*'(?:filter|other)',\s*'oem',\s*'[^']+',\s*'([^']+)'\)/g;
  const out: string[] = [];
  let m: RegExpExecArray | null = re2.exec(sql);
  while (m) {
    out.push(m[1]);
    m = re2.exec(sql);
  }
  void re;
  return [...new Set(out)];
}

interface RakutenItem {
  itemName?: string;
  mediumImageUrls?: Array<{ imageUrl: string } | string>;
}

async function searchRakuten(keyword: string, hits = 5): Promise<RakutenItem[]> {
  const appId = process.env.RAKUTEN_APP_ID!;
  const accessKey = process.env.RAKUTEN_ACCESS_KEY!;
  const origin = process.env.RAKUTEN_ORIGIN ?? "http://example.com";
  const params = new URLSearchParams({
    applicationId: appId,
    keyword,
    hits: String(hits),
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

function firstImage(items: RakutenItem[]): string | null {
  for (const it of items) {
    const f = it.mediumImageUrls?.[0];
    if (f) return typeof f === "string" ? f : f.imageUrl;
  }
  return null;
}

async function main() {
  const mpns = loadMpns();
  console.error(`Loaded ${mpns.length} MPNs from 0008.`);

  const images: { mpn: string; image_url: string | null }[] = [];
  for (const mpn of mpns) {
    console.error(`[img] ${mpn}`);
    const items = await searchRakuten(mpn, 5);
    images.push({ mpn, image_url: firstImage(items) });
    await new Promise((r) => setTimeout(r, 1300));
  }

  // Panasonic 50クラス 加湿フィルター調査
  const panaHumid: { query: string; candidates: { pn: string; count: number }[]; sample: string }[] = [];
  const humidQueries = [
    "パナソニック 加湿フィルター F-VXG50",
    "パナソニック 加湿フィルター F-VXH50",
    "パナソニック 空気清浄機 加湿フィルター 制菌 F-ZX",
  ];
  const humidPat = /\bF-Z[A-Z]{2,3}[0-9]{2,3}\b/gi;
  for (const q of humidQueries) {
    console.error(`[pana] ${q}`);
    const items = await searchRakuten(q, 15);
    const counts = new Map<string, number>();
    let sample = "";
    for (const it of items) {
      const t = it.itemName ?? "";
      if (!sample && t) sample = t;
      humidPat.lastIndex = 0;
      let m: RegExpExecArray | null = humidPat.exec(t);
      while (m) {
        const pn = m[0].toUpperCase();
        counts.set(pn, (counts.get(pn) ?? 0) + 1);
        m = humidPat.exec(t);
      }
    }
    panaHumid.push({
      query: q,
      candidates: [...counts.entries()].map(([pn, count]) => ({ pn, count })).sort((a, b) => b.count - a.count),
      sample,
    });
    await new Promise((r) => setTimeout(r, 1300));
  }

  console.log(JSON.stringify({ images, panaHumid }, null, 2));
  console.error("\nDone.");
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
