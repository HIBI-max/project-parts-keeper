/**
 * 楽天 API の itemName 文字列からメーカー公式品番を抽出するディスカバリスクリプト。
 *
 * Supabase の appliances テーブルから直接機種一覧を読むので、seed.sql に機種を
 * 追加すれば次回の discover で自動的にカバーされる。
 *
 * 使い方:
 *   pnpm tsx scripts/discover-parts.ts
 *
 * 出力:
 *   stdout に discover-output.json（JSON）。
 *   stderr に進行ログ。
 */

import { createClient } from "@supabase/supabase-js";
import { config } from "dotenv";
import { resolve } from "node:path";

config({ path: resolve(process.cwd(), ".env.local"), quiet: true });

// カテゴリ別の「探したい部品」キーワード
const SEARCH_KEYWORDS_BY_CATEGORY: Record<string, string[]> = {
  rice_cooker: ["内釜", "蒸気ふた", "内ぶた"],
  washing_machine: ["糸くずフィルター", "給水ホース", "排水フィルター"],
  vacuum: ["バッテリー", "床用ブラシ", "紙パック"],
  air_conditioner: ["フィルター", "リモコン"],
  microwave: ["ターンテーブル", "扉パッキン"],
  refrigerator: ["製氷皿", "ドアパッキン", "野菜ケース"],
  other: [],
};

// メーカー別の典型的な部品番号パターン
const PART_NUMBER_PATTERNS: RegExp[] = [
  /\bARE[0-9]{1,3}-[A-Z][0-9]+\b/g,       // Panasonic 内釜 (ARE50-M78)
  /\bARB[0-9]+-[A-Z0-9]+\b/g,              // Panasonic 蒸気ふた (ARB96-...)
  /\bAXW[0-9]+-?[A-Z0-9]+\b/g,             // Panasonic 洗濯機 (AXW22A-9DK0)
  /\bAVE[0-9]+-[0-9A-Z]+\b/g,              // Panasonic 小物
  /\bA[0-9]{3}-[0-9]{3,4}\b/g,             // Panasonic 共通系
  /\bB[0-9]{3}-[0-9][A-Z]\b/g,             // 象印 (B654-6B)
  /\bJPI[0-9]{3,4}\b/g,                    // タイガー 内釜 (JPI1019)
  /\bJPL[0-9]{3,4}\b/g,                    // タイガー
  /\bJPC[0-9]{3,4}\b/g,                    // タイガー
  /\bRC-[0-9]+[A-Z]+\b/g,                  // 東芝 炊飯器
  /\bNJ-[A-Z]{2,4}[0-9]+\b/g,              // 三菱 炊飯器
  /\bM[0-9]{2}[A-Z][0-9]{4,6}\b/g,         // 三菱 内釜 (M15X16340)
  /\bSPB-[A-Z0-9-]+\b/g,                   // シャープ 系
  /\b[0-9]{3}[A-Z][0-9]{4}\b/g,            // 東芝 (320A2450)
  /\b\d{8,12}\b/g,                         // 数字のみ品番（シャープ・東芝冷蔵庫等）
];

interface Appliance {
  manufacturer: string;
  model_number: string;
  category: string;
}

interface DiscoveryResult {
  appliance: string;
  manufacturer: string;
  category: string;
  part_category: string;
  keyword: string;
  hits: number;
  candidates: { part_number: string; count: number; sample_title: string }[];
}

interface RakutenSearchRes {
  hits?: number;
  Items?: Array<{ itemName?: string }>;
}

async function searchRakuten(keyword: string): Promise<RakutenSearchRes> {
  const appId = process.env.RAKUTEN_APP_ID!;
  const accessKey = process.env.RAKUTEN_ACCESS_KEY!;
  const origin = process.env.RAKUTEN_ORIGIN ?? "http://example.com";

  const params = new URLSearchParams({
    applicationId: appId,
    keyword,
    hits: "10",
    formatVersion: "2",
    availability: "1",
  });
  const url = `https://openapi.rakuten.co.jp/ichibams/api/IchibaItem/Search/20260401?${params}`;
  const res = await fetch(url, {
    headers: { accessKey, Origin: origin, Referer: `${origin}/` },
  });
  if (!res.ok) {
    const text = await res.text().catch(() => "");
    throw new Error(`Rakuten ${res.status}: ${text.slice(0, 200)}`);
  }
  return res.json();
}

function extractPartNumbers(
  titles: string[],
  excludeModel: string,
): { part_number: string; count: number; sample_title: string }[] {
  const counts = new Map<string, { count: number; sample: string }>();
  for (const title of titles) {
    for (const pattern of PART_NUMBER_PATTERNS) {
      pattern.lastIndex = 0;
      let m: RegExpExecArray | null = pattern.exec(title);
      while (m) {
        const pn = m[0];
        // 機種番号そのものは部品番号ではないので除外
        if (pn !== excludeModel) {
          const prev = counts.get(pn);
          if (prev) prev.count++;
          else counts.set(pn, { count: 1, sample: title });
        }
        m = pattern.exec(title);
      }
    }
  }
  return [...counts.entries()]
    .map(([part_number, { count, sample }]) => ({ part_number, count, sample_title: sample }))
    .sort((a, b) => b.count - a.count);
}

async function loadAppliances(): Promise<Appliance[]> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL!;
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;
  const supabase = createClient(url, key);
  const { data, error } = await supabase
    .from("appliances")
    .select("manufacturer, model_number, category")
    .order("manufacturer");
  if (error) throw error;
  return (data ?? []) as Appliance[];
}

async function main() {
  const appliances = await loadAppliances();
  console.error(`Loaded ${appliances.length} appliances from DB.`);

  const results: DiscoveryResult[] = [];

  for (const a of appliances) {
    const keywords = SEARCH_KEYWORDS_BY_CATEGORY[a.category] ?? [];
    for (const kw of keywords) {
      const fullKeyword = `${kw} ${a.model_number}`;
      console.error(`[query] ${fullKeyword}`);
      try {
        const r = await searchRakuten(fullKeyword);
        const titles = (r.Items ?? [])
          .map((it) => it.itemName ?? "")
          .filter(Boolean);
        const candidates = extractPartNumbers(titles, a.model_number).slice(0, 5);
        results.push({
          appliance: a.model_number,
          manufacturer: a.manufacturer,
          category: a.category,
          part_category: kw,
          keyword: fullKeyword,
          hits: r.hits ?? 0,
          candidates,
        });
      } catch (e) {
        console.error(`  error: ${e instanceof Error ? e.message : e}`);
      }
      // rate limit (1 req/sec、安全マージン込み)
      await new Promise((r) => setTimeout(r, 1300));
    }
  }

  console.log(JSON.stringify(results, null, 2));
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
