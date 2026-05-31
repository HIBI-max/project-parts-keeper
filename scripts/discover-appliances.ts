/**
 * 楽天市場の itemName + itemCaption（「対応機種」記載）から
 * 未収録の家電モデル番号を自動発掘するスクリプト。
 *
 * 戦略:
 *   - メーカー名 + 部品名 で広く検索（例: "Panasonic 炊飯器 内釜"）
 *   - 戻ってきた商品のタイトル + キャプションを正規表現で走査
 *   - メーカー別の典型的なモデル番号パターンを抽出
 *   - 既に DB にあるモデルは除外、未収録のみリストアップ
 *
 * 使い方:
 *   pnpm tsx scripts/discover-appliances.ts
 *
 * 出力:
 *   stdout に candidate-appliances.json（カテゴリ別の新規候補）
 *   stderr に進行ログ
 */

import { createClient } from "@supabase/supabase-js";
import { config } from "dotenv";
import { resolve } from "node:path";

config({ path: resolve(process.cwd(), ".env.local"), quiet: true });

interface SearchSpec {
  manufacturer: string;
  category: string;
  keywords: string[];
  modelPatterns: RegExp[];
}

// メーカー × カテゴリ × 検索キーワード × 抽出パターン
const SEARCH_SPECS: SearchSpec[] = [
  // ===== 炊飯器 =====
  {
    manufacturer: "Panasonic",
    category: "rice_cooker",
    keywords: ["パナソニック 炊飯器 内釜", "Panasonic 炊飯器 内釜", "おどり炊き 内釜"],
    modelPatterns: [/\bSR-[A-Z]{2,4}[0-9]+[A-Z]?\b/g, /\bSR-CVSX[0-9]+[A-Z]?\b/g],
  },
  {
    manufacturer: "象印",
    category: "rice_cooker",
    keywords: ["象印 炊飯器 内釜", "象印 炎舞炊き 内釜", "象印 極め炊き 内釜"],
    modelPatterns: [/\bNW-[A-Z]{2}[0-9]+[A-Z]?\b/g, /\bNP-[A-Z]{2}[0-9]+[A-Z]?\b/g],
  },
  {
    manufacturer: "タイガー魔法瓶",
    category: "rice_cooker",
    keywords: ["タイガー 炊飯器 内釜", "ご泡火炊き 内釜", "タイガー 内ぶた"],
    modelPatterns: [
      /\bJP[ILCBV]-[A-Z]{1,2}[0-9]+[A-Z]?\b/g,
      /\bJP[ILCBV][0-9]{4,5}\b/g,
    ],
  },
  {
    manufacturer: "東芝",
    category: "rice_cooker",
    keywords: ["東芝 炊飯器 内釜", "東芝 真空圧力 内釜"],
    modelPatterns: [/\bRC-[0-9]+[A-Z]+[0-9]*\b/g, /\bRC-[0-9]+V[A-Z]{2,4}\b/g],
  },
  {
    manufacturer: "三菱電機",
    category: "rice_cooker",
    keywords: ["三菱 炊飯器 内釜", "本炭釜 内釜", "三菱 炭炊釜"],
    modelPatterns: [/\bNJ-[A-Z]{2,4}[0-9]+[A-Z]?\b/g],
  },
  {
    manufacturer: "日立",
    category: "rice_cooker",
    keywords: ["日立 炊飯器 内釜", "ふっくら御膳 内釜"],
    modelPatterns: [/\bRZ-[A-Z]{1,3}[0-9]+[A-Z]*\b/g],
  },

  // ===== 洗濯機 =====
  {
    manufacturer: "Panasonic",
    category: "washing_machine",
    keywords: ["パナソニック 洗濯機 フィルター", "Panasonic 洗濯機 部品"],
    modelPatterns: [/\bNA-[A-Z]{1,4}[0-9]+[A-Z]*[0-9]*\b/g],
  },
  {
    manufacturer: "日立",
    category: "washing_machine",
    keywords: ["日立 洗濯機 フィルター", "ビートウォッシュ フィルター"],
    modelPatterns: [/\bBW-[A-Z]+[0-9]+[A-Z]*\b/g],
  },
  {
    manufacturer: "シャープ",
    category: "washing_machine",
    keywords: ["シャープ 洗濯機 フィルター"],
    modelPatterns: [/\bES-[A-Z]{1,3}[0-9]+[A-Z]?\b/g],
  },
  {
    manufacturer: "東芝",
    category: "washing_machine",
    keywords: ["東芝 洗濯機 フィルター", "ZABOON フィルター"],
    modelPatterns: [/\bAW-[0-9]+[A-Z]+[0-9]*\b/g],
  },

  // ===== 掃除機 =====
  {
    manufacturer: "ダイソン",
    category: "vacuum",
    keywords: ["ダイソン バッテリー", "ダイソン V", "Dyson コードレス バッテリー"],
    modelPatterns: [/\bV[0-9]+(?:\s+(?:Detect|Slim|Absolute))?(?:\s+(?:Slim|Absolute))?\b/g],
  },
  {
    manufacturer: "シャープ",
    category: "vacuum",
    keywords: ["シャープ 掃除機 バッテリー", "RACTIVE Air"],
    modelPatterns: [/\bEC-[A-Z]{1,4}[0-9]+[A-Z]?\b/g],
  },
  {
    manufacturer: "Panasonic",
    category: "vacuum",
    keywords: ["パナソニック コードレス掃除機 バッテリー"],
    modelPatterns: [/\bMC-[A-Z]{2,3}[0-9]+[A-Z]?\b/g],
  },
  {
    manufacturer: "日立",
    category: "vacuum",
    keywords: ["日立 掃除機 バッテリー"],
    modelPatterns: [/\bPV-[A-Z]{1,4}[0-9]+[A-Z]?\b/g],
  },

  // ===== エアコン =====
  {
    manufacturer: "Panasonic",
    category: "air_conditioner",
    keywords: ["エオリア フィルター", "Panasonic エアコン フィルター"],
    modelPatterns: [/\bCS-[A-Z]+[0-9]+[A-Z]*[0-9]*\b/g],
  },
  {
    manufacturer: "ダイキン",
    category: "air_conditioner",
    keywords: ["ダイキン エアコン フィルター", "うるるとさらら フィルター"],
    modelPatterns: [/\bAN[0-9]+[A-Z]+-[A-Z]\b/g],
  },
  {
    manufacturer: "日立",
    category: "air_conditioner",
    keywords: ["日立 エアコン フィルター", "白くまくん フィルター"],
    modelPatterns: [/\bRAS-[A-Z]+[0-9]+[A-Z]*\b/g],
  },
  {
    manufacturer: "三菱電機",
    category: "air_conditioner",
    keywords: ["霧ヶ峰 フィルター", "三菱 エアコン フィルター"],
    modelPatterns: [/\bMSZ-[A-Z]+[0-9]+[A-Z]?\b/g],
  },

  // ===== 電子レンジ =====
  {
    manufacturer: "Panasonic",
    category: "microwave",
    keywords: ["ビストロ ターンテーブル", "Panasonic 電子レンジ 部品"],
    modelPatterns: [/\bNE-[A-Z]+[0-9]+[A-Z]?\b/g],
  },
  {
    manufacturer: "日立",
    category: "microwave",
    keywords: ["ヘルシーシェフ ターンテーブル", "日立 電子レンジ 部品"],
    modelPatterns: [/\bMRO-[A-Z]+[0-9]*[A-Z]*\b/g],
  },
  {
    manufacturer: "東芝",
    category: "microwave",
    keywords: ["石窯ドーム ターンテーブル", "東芝 電子レンジ 部品"],
    modelPatterns: [/\bER-[A-Z]+[0-9]+[A-Z]*\b/g],
  },
  {
    manufacturer: "シャープ",
    category: "microwave",
    keywords: ["ヘルシオ ターンテーブル", "シャープ 電子レンジ 部品"],
    modelPatterns: [/\bAX-[A-Z]+[0-9]+[A-Z]?\b/g],
  },

  // ===== 冷蔵庫 =====
  {
    manufacturer: "Panasonic",
    category: "refrigerator",
    keywords: ["Panasonic 冷蔵庫 製氷皿", "Panasonic 冷蔵庫 野菜ケース"],
    modelPatterns: [/\bNR-[A-Z]+[0-9]+[A-Z]*\b/g],
  },
  {
    manufacturer: "日立",
    category: "refrigerator",
    keywords: ["日立 冷蔵庫 製氷皿", "まんなか野菜 部品"],
    modelPatterns: [/\bR-[A-Z]{1,3}[0-9]+[A-Z]?\b/g],
  },
  {
    manufacturer: "三菱電機",
    category: "refrigerator",
    keywords: ["三菱 冷蔵庫 製氷皿"],
    modelPatterns: [/\bMR-[A-Z]+[0-9]+[A-Z]?\b/g],
  },
  {
    manufacturer: "東芝",
    category: "refrigerator",
    keywords: ["ベジータ 部品", "東芝 冷蔵庫 製氷皿"],
    modelPatterns: [/\bGR-[A-Z][0-9]+[A-Z]+\b/g],
  },

  // ===== 空気清浄機 =====
  {
    manufacturer: "シャープ",
    category: "air_purifier",
    keywords: [
      "シャープ 空気清浄機 集じんフィルター",
      "プラズマクラスター 空気清浄機 フィルター",
    ],
    modelPatterns: [/\b(?:KI|KC|FU)-[A-Z]{1,3}[0-9]{2,3}[A-Z0-9]*\b/g],
  },
  {
    manufacturer: "Panasonic",
    category: "air_purifier",
    keywords: ["パナソニック 空気清浄機 集じんフィルター", "ナノイー 空気清浄機 フィルター"],
    modelPatterns: [/\bF-(?:V|P)[A-Z]{1,2}[0-9]{2,3}[A-Z0-9]*\b/g],
  },
  {
    manufacturer: "ダイキン",
    category: "air_purifier",
    keywords: ["ダイキン 空気清浄機 集じんフィルター", "ダイキン ストリーマ 空気清浄機 フィルター"],
    modelPatterns: [/\b(?:MCK|ACK|TCK|MCZ|MC)[0-9]{2,3}[A-Z]{0,2}\b/g],
  },
  {
    manufacturer: "日立",
    category: "air_purifier",
    keywords: ["日立 空気清浄機 フィルター", "日立 加湿空気清浄機 フィルター"],
    modelPatterns: [/\bEP-[A-Z]{1,3}[0-9]{2,3}[A-Z]?\b/g],
  },
];

interface CandidateModel {
  manufacturer: string;
  category: string;
  model_number: string;
  occurrences: number; // 何件のリストに登場したか
  sample_title: string;
}

interface RakutenItem {
  itemName?: string;
  itemCaption?: string;
}

async function searchRakuten(keyword: string): Promise<RakutenItem[]> {
  const appId = process.env.RAKUTEN_APP_ID!;
  const accessKey = process.env.RAKUTEN_ACCESS_KEY!;
  const origin = process.env.RAKUTEN_ORIGIN ?? "http://example.com";

  const params = new URLSearchParams({
    applicationId: appId,
    keyword,
    hits: "30",
    formatVersion: "2",
    availability: "1",
  });
  const url = `https://openapi.rakuten.co.jp/ichibams/api/IchibaItem/Search/20260401?${params}`;
  const res = await fetch(url, {
    headers: { accessKey, Origin: origin, Referer: `${origin}/` },
  });
  if (!res.ok) return [];
  const json = (await res.json()) as { Items?: RakutenItem[] };
  return json.Items ?? [];
}

async function loadExistingModels(): Promise<Set<string>> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL!;
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;
  const supabase = createClient(url, key);
  const { data, error } = await supabase.from("appliances").select("model_number");
  if (error) throw error;
  return new Set((data ?? []).map((a: { model_number: string }) => a.model_number));
}

async function main() {
  const known = await loadExistingModels();
  console.error(`Loaded ${known.size} existing models.`);

  const candidates = new Map<string, CandidateModel>();

  for (const spec of SEARCH_SPECS) {
    for (const kw of spec.keywords) {
      console.error(`[query] ${spec.manufacturer} / ${kw}`);
      const items = await searchRakuten(kw);
      for (const item of items) {
        const text = `${item.itemName ?? ""} ${item.itemCaption ?? ""}`;
        for (const pattern of spec.modelPatterns) {
          pattern.lastIndex = 0;
          let m: RegExpExecArray | null = pattern.exec(text);
          while (m) {
            const modelNum = m[0].trim();
            if (modelNum.length < 4) {
              m = pattern.exec(text);
              continue;
            }
            if (known.has(modelNum)) {
              m = pattern.exec(text);
              continue;
            }
            const key = `${spec.manufacturer}::${modelNum}`;
            const prev = candidates.get(key);
            if (prev) {
              prev.occurrences++;
            } else {
              candidates.set(key, {
                manufacturer: spec.manufacturer,
                category: spec.category,
                model_number: modelNum,
                occurrences: 1,
                sample_title: item.itemName ?? "",
              });
            }
            m = pattern.exec(text);
          }
        }
      }
      // rate limit
      await new Promise((r) => setTimeout(r, 1300));
    }
  }

  const sorted = [...candidates.values()].sort((a, b) => b.occurrences - a.occurrences);
  console.log(JSON.stringify(sorted, null, 2));
  console.error(`\nFound ${sorted.length} new candidate models.`);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
