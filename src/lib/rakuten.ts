/**
 * 楽天市場 API クライアント（2024 年以降の新方式：accessKey + Origin チェック付き）
 * docs: https://webservice.rakuten.co.jp/documentation/ichiba-item-search
 */

const ENDPOINT = "https://openapi.rakuten.co.jp/ichibams/api/IchibaItem/Search/20260401";

// 楽天アプリ登録時の「アプリケーションURL」と一致する Origin を送信する必要がある。
// サーバーサイド fetch だと Origin が付かないため明示する。
const ORIGIN = process.env.RAKUTEN_ORIGIN ?? "http://localhost:3003";

export interface RakutenItem {
  itemCode: string;
  itemName: string;
  itemPrice: number;
  itemUrl: string;        // 通常 URL
  affiliateUrl: string;   // アフィリエイト ID 設定時のみ非空
  shopName: string;
  mediumImageUrl: string | null;
  availability: number;   // 1 = 在庫あり
}

interface RakutenApiResponseRaw {
  Items?: Array<{ Item: RawItem }>;
  error?: string;
  error_description?: string;
}

interface RawItem {
  itemCode: string;
  itemName: string;
  itemPrice: number;
  itemUrl: string;
  affiliateUrl?: string;
  shopName: string;
  mediumImageUrls?: Array<{ imageUrl: string }>;
  availability: number;
}

export async function searchRakuten(
  keyword: string,
  opts: { hits?: number } = {},
): Promise<{ items: RakutenItem[]; error?: string }> {
  const appId = process.env.RAKUTEN_APP_ID;
  const accessKey = process.env.RAKUTEN_ACCESS_KEY;
  if (!appId) return { items: [], error: "RAKUTEN_APP_ID is not configured" };
  if (!accessKey) return { items: [], error: "RAKUTEN_ACCESS_KEY is not configured" };

  const params = new URLSearchParams({
    applicationId: appId,
    keyword,
    hits: String(opts.hits ?? 10),
    formatVersion: "2",
    availability: "1",
    sort: "+itemPrice",
  });
  const affId = process.env.RAKUTEN_AFFILIATE_ID;
  if (affId) params.set("affiliateId", affId);

  const url = `${ENDPOINT}?${params}`;

  try {
    const res = await fetch(url, {
      headers: {
        accessKey,
        Origin: ORIGIN,
        Referer: `${ORIGIN}/`,
      },
      next: { revalidate: 60 * 30 }, // 30 分キャッシュ
    });
    if (!res.ok) {
      const body = await res.text().catch(() => "");
      return { items: [], error: `Rakuten API ${res.status}: ${body.slice(0, 200)}` };
    }
    // formatVersion=2 だと Items は配列の配列ではなく item の配列。
    // ただし型の安全のため両方をハンドルする。
    const json = (await res.json()) as RakutenApiResponseRaw | { Items?: RawItem[] };
    const rawItems = normalizeItems(json);
    const items: RakutenItem[] = rawItems.map((it) => ({
      itemCode: it.itemCode,
      itemName: it.itemName,
      itemPrice: it.itemPrice,
      itemUrl: it.itemUrl,
      affiliateUrl: it.affiliateUrl ?? it.itemUrl,
      shopName: it.shopName,
      mediumImageUrl: it.mediumImageUrls?.[0]?.imageUrl ?? null,
      availability: it.availability,
    }));
    return { items };
  } catch (e) {
    return { items: [], error: e instanceof Error ? e.message : "unknown error" };
  }
}

function normalizeItems(
  json: RakutenApiResponseRaw | { Items?: RawItem[] },
): RawItem[] {
  if (!json || !("Items" in json) || !json.Items) return [];
  const first = json.Items[0] as unknown;
  if (first && typeof first === "object" && "Item" in (first as object)) {
    return (json.Items as Array<{ Item: RawItem }>).map((x) => x.Item);
  }
  return json.Items as RawItem[];
}
