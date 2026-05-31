/**
 * 空気清浄機モデルの自動発掘（DB 非依存・使い捨てスクリプト）。
 * 楽天で「{メーカー} 空気清浄機 フィルター」等を検索し、itemName/itemCaption から
 * 実在するモデル番号を正規表現で抽出する。新カテゴリ air_purifier の初期 seed 用。
 *
 *   pnpm tsx scripts/discover-air-purifiers.ts
 *
 * 出力: stdout に candidate JSON、stderr に進行ログ。
 */

import { config } from "dotenv";
import { resolve } from "node:path";

config({ path: resolve(process.cwd(), ".env.local"), quiet: true });

interface Spec {
  manufacturer: string;
  keywords: string[];
  modelPatterns: RegExp[];
}

const SPECS: Spec[] = [
  {
    manufacturer: "シャープ",
    keywords: [
      "シャープ 空気清浄機 集じんフィルター",
      "シャープ 加湿空気清浄機 フィルター",
      "プラズマクラスター 空気清浄機 フィルター",
      "シャープ 空気清浄機 脱臭フィルター",
    ],
    // KI-xx70, KC-xx50, FU-xx50 など
    modelPatterns: [/\b(?:KI|KC|FU)-[A-Z]{1,3}[0-9]{2,3}[A-Z0-9]*\b/g],
  },
  {
    manufacturer: "Panasonic",
    keywords: [
      "パナソニック 空気清浄機 集じんフィルター",
      "Panasonic 加湿空気清浄機 フィルター",
      "ナノイー 空気清浄機 フィルター",
    ],
    // F-VXT70, F-VC70XV, F-PXV60 など（F-Z 始まりは部品なので除外）
    modelPatterns: [/\bF-(?:V|P)[A-Z]{1,2}[0-9]{2,3}[A-Z0-9]*\b/g],
  },
  {
    manufacturer: "ダイキン",
    keywords: [
      "ダイキン 空気清浄機 集じんフィルター",
      "ダイキン 加湿空気清浄機 フィルター",
      "ダイキン ストリーマ 空気清浄機 フィルター",
    ],
    // MCK70Z, MC55Z, ACK70 など
    modelPatterns: [/\b(?:MCK|ACK|TCK|MCZ|MC)[0-9]{2,3}[A-Z]{0,2}\b/g],
  },
  {
    manufacturer: "日立",
    keywords: ["日立 空気清浄機 フィルター", "日立 加湿空気清浄機 フィルター"],
    // EP-NVG90, EP-Z30S など（EPF- は部品）
    modelPatterns: [/\bEP-[A-Z]{1,3}[0-9]{2,3}[A-Z]?\b/g],
  },
  {
    manufacturer: "アイリスオーヤマ",
    keywords: ["アイリスオーヤマ 空気清浄機 フィルター", "IRIS 空気清浄機 集じんフィルター"],
    // IAP-A35, RMDK-50, MSAP-AC100 など多様
    modelPatterns: [
      /\bIAP-[A-Z][0-9]{2,3}[A-Z]?\b/g,
      /\bRMDK-[0-9]{2,3}\b/g,
      /\bSAP-[0-9]{3}[A-Z]?\b/g,
    ],
  },
  {
    manufacturer: "東芝",
    keywords: ["東芝 空気清浄機 フィルター", "東芝 加湿空気清浄機 フィルター"],
    modelPatterns: [/\bCAF-[A-Z][0-9]{2,3}[A-Z]?\b/g],
  },
  {
    manufacturer: "バルミューダ",
    keywords: ["バルミューダ 空気清浄機 フィルター", "BALMUDA AirEngine フィルター"],
    modelPatterns: [/\bEJT-[0-9]{4}[A-Z]?\b/g],
  },
  {
    manufacturer: "カドー",
    keywords: ["cado 空気清浄機 フィルター", "カドー 空気清浄機 交換フィルター"],
    modelPatterns: [/\bAP-[A-Z][0-9]{3}\b/g, /\bLEAF[0-9]{2,3}\b/g],
  },
];

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
  if (!res.ok) {
    console.error(`  rakuten ${res.status} for "${keyword}"`);
    return [];
  }
  const json = (await res.json()) as { Items?: RakutenItem[] };
  return json.Items ?? [];
}

interface Candidate {
  manufacturer: string;
  model_number: string;
  occurrences: number;
  sample_title: string;
}

async function main() {
  const candidates = new Map<string, Candidate>();

  for (const spec of SPECS) {
    for (const kw of spec.keywords) {
      console.error(`[query] ${kw}`);
      const items = await searchRakuten(kw);
      for (const item of items) {
        const text = `${item.itemName ?? ""} ${item.itemCaption ?? ""}`;
        for (const pattern of spec.modelPatterns) {
          pattern.lastIndex = 0;
          let m: RegExpExecArray | null = pattern.exec(text);
          while (m) {
            const model = m[0].trim();
            if (model.length >= 4) {
              const key = `${spec.manufacturer}::${model}`;
              const prev = candidates.get(key);
              if (prev) prev.occurrences++;
              else
                candidates.set(key, {
                  manufacturer: spec.manufacturer,
                  model_number: model,
                  occurrences: 1,
                  sample_title: item.itemName ?? "",
                });
            }
            m = pattern.exec(text);
          }
        }
      }
      await new Promise((r) => setTimeout(r, 1300));
    }
  }

  const sorted = [...candidates.values()].sort((a, b) => b.occurrences - a.occurrences);
  console.log(JSON.stringify(sorted, null, 2));
  console.error(`\nFound ${sorted.length} candidate air-purifier models.`);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
