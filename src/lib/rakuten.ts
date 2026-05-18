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

/**
 * listings テーブルから直近 24h のキャッシュを取得（ない場合 null）。
 * keyword: 楽天検索キーワード = 通常は manufacturer_part_number か part.name
 */
import type { SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/types/database";

export interface CachedRakutenResult {
  items: RakutenItem[];
  source: "cache";
  fetched_at: string;
}

export async function getCachedRakuten(
  supabase: SupabaseClient<Database>,
  partId: string,
  maxAgeHours = 24,
): Promise<CachedRakutenResult | null> {
  const since = new Date(Date.now() - maxAgeHours * 3600_000).toISOString();
  const { data } = await supabase
    .from("listings")
    .select("title, url, affiliate_url, price_jpy, in_stock, shop_name, fetched_at")
    .eq("part_id", partId)
    .eq("source", "rakuten")
    .gte("fetched_at", since)
    .order("price_jpy", { ascending: true })
    .limit(10);
  if (!data || data.length === 0) return null;
  const items: RakutenItem[] = data.map((d) => ({
    itemCode: d.url,
    itemName: d.title,
    itemPrice: d.price_jpy ?? 0,
    itemUrl: d.url,
    affiliateUrl: d.affiliate_url ?? d.url,
    shopName: d.shop_name ?? "",
    mediumImageUrl: null,
    availability: d.in_stock === false ? 0 : 1,
  }));
  return { items, source: "cache", fetched_at: data[0].fetched_at };
}

/** searchRakuten 結果を listings テーブルに upsert (best-effort、エラー無視) */
export async function cacheRakutenResults(
  supabase: SupabaseClient<Database>,
  partId: string,
  items: RakutenItem[],
): Promise<void> {
  if (items.length === 0) return;
  try {
    await supabase
      .from("listings")
      .delete()
      .eq("part_id", partId)
      .eq("source", "rakuten");
    await supabase.from("listings").insert(
      items.slice(0, 10).map((it) => ({
        part_id: partId,
        source: "rakuten" as const,
        title: it.itemName,
        url: it.itemUrl,
        affiliate_url: it.affiliateUrl,
        price_jpy: it.itemPrice || null,
        in_stock: it.availability === 1,
        shop_name: it.shopName,
      })),
    );
  } catch {
    // best-effort - ignore errors
  }
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
