import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import { MarketplaceLinks } from "@/components/MarketplaceLinks";
import { PART_CATEGORY_LABEL, formatJPY } from "@/lib/format";
import { searchRakuten } from "@/lib/rakuten";
import { createClient } from "@/lib/supabase/server";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ id: string }>;
}): Promise<Metadata> {
  const { id } = await params;
  const supabase = await createClient();
  const { data } = await supabase
    .from("parts")
    .select("name, manufacturer, manufacturer_part_number, image_url, kind")
    .eq("id", id)
    .maybeSingle();

  if (!data) return { title: "部品が見つかりませんでした — Parts Keeper" };

  const title = `${data.name}${data.manufacturer_part_number ? ` (${data.manufacturer_part_number})` : ""} — Parts Keeper`;
  const kindLabel = data.kind === "oem" ? "純正品" : "互換品";
  const description = `${data.manufacturer ?? ""} ${data.name} の${kindLabel}を楽天市場・Amazon・Yahoo!ショッピング・メルカリ・ヤフオクで横断検索。`.trim();

  return {
    title,
    description,
    openGraph: {
      title,
      description,
      images: data.image_url ? [data.image_url] : undefined,
    },
    twitter: { title, description, card: "summary_large_image" },
  };
}

interface PartRow {
  id: string;
  name: string;
  category: string;
  kind: string;
  manufacturer: string | null;
  manufacturer_part_number: string | null;
  description: string | null;
  image_url: string | null;
}

export default async function PartPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const supabase = await createClient();

  const { data } = await supabase
    .from("parts")
    .select(
      "id, name, category, kind, manufacturer, manufacturer_part_number, description, image_url",
    )
    .eq("id", id)
    .maybeSingle();

  if (!data) notFound();
  const part = data as PartRow;

  // この部品が適合する家電一覧
  const { data: fitData } = await supabase
    .from("appliance_parts")
    .select("fitment_note, appliances (id, manufacturer, model_number, model_name, category)")
    .eq("part_id", id);

  interface FitRow {
    fitment_note: string | null;
    appliances: {
      id: string;
      manufacturer: string;
      model_number: string;
      model_name: string | null;
      category: string;
    } | null;
  }
  const fitAppliances = ((fitData ?? []) as unknown as FitRow[])
    .filter((r) => r.appliances)
    .map((r) => ({ ...r.appliances!, fitment_note: r.fitment_note }));

  // 楽天検索キーワード: 公式品番があれば最優先、なければ部品名（"内釜 SR-MPA101" 形式）。
  // メーカー名を足すと AND 検索で結果が逆に減るのでフォールバックでは付けない。
  const keyword = part.manufacturer_part_number ?? part.name;
  const { items: rakutenItems, error: rakutenErr } = await searchRakuten(
    keyword,
    { hits: 6 },
  );

  return (
    <div className="mx-auto max-w-3xl px-4 py-6">
      <Link
        href="/"
        className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]"
      >
        ← トップへ
      </Link>

      <section className="mt-3 bg-[var(--card)] border border-[var(--card-border)] rounded-xl p-5">
        <div className="flex gap-4">
          {part.image_url && (
            <Image
              src={part.image_url}
              alt={part.name}
              width={96}
              height={96}
              className="shrink-0 w-20 h-20 sm:w-24 sm:h-24 object-contain rounded border border-[var(--card-border)] bg-white"
              unoptimized
            />
          )}
          <div className="min-w-0 flex-1">
            <div className="text-xs text-[var(--muted)]">
              {PART_CATEGORY_LABEL[part.category] ?? part.category} ·{" "}
              {part.kind === "oem" ? "純正品" : "互換品"}
            </div>
            <h1 className="text-xl sm:text-2xl font-bold mt-1 break-words">{part.name}</h1>
            {part.manufacturer_part_number && (
              <div className="text-sm text-[var(--muted)] mt-1 font-mono">
                品番: {part.manufacturer_part_number}
              </div>
            )}
          </div>
        </div>
        {part.description && (
          <p className="mt-3 text-sm leading-relaxed">{part.description}</p>
        )}
      </section>

      <h2 className="mt-8 mb-3 text-sm font-semibold text-[var(--muted)] uppercase tracking-wider">
        楽天市場で探す
      </h2>

      {rakutenErr && (
        <div className="rounded-lg bg-yellow-50 border border-yellow-200 px-4 py-3 text-sm text-yellow-900">
          楽天 API: {rakutenErr}
          {rakutenErr.includes("RAKUTEN_APP_ID") && (
            <div className="mt-1 text-xs">
              `.env.local` に RAKUTEN_APP_ID を設定してください。
            </div>
          )}
        </div>
      )}

      {!rakutenErr && rakutenItems.length === 0 && (
        <div className="text-center py-8 text-sm text-[var(--muted)]">
          楽天で在庫が見つかりませんでした。
        </div>
      )}

      <ul className="space-y-2">
        {rakutenItems.map((item) => (
          <li key={item.itemCode}>
            <a
              href={item.affiliateUrl}
              target="_blank"
              rel="noopener noreferrer sponsored"
              className="flex gap-3 bg-[var(--card)] border border-[var(--card-border)] rounded-lg p-3 hover:border-[var(--accent)] transition-colors"
            >
              {item.mediumImageUrl && (
                <Image
                  src={item.mediumImageUrl}
                  alt=""
                  width={72}
                  height={72}
                  className="shrink-0 rounded object-cover bg-white"
                  unoptimized
                />
              )}
              <div className="min-w-0 flex-1">
                <div className="text-sm leading-snug line-clamp-2">
                  {item.itemName}
                </div>
                <div className="mt-1 flex items-baseline justify-between">
                  <div className="text-xs text-[var(--muted)] truncate">
                    {item.shopName}
                  </div>
                  <div className="text-base font-semibold tabular-nums text-[var(--accent-deep)] shrink-0 ml-2">
                    {formatJPY(item.itemPrice)}
                  </div>
                </div>
              </div>
            </a>
          </li>
        ))}
      </ul>

      <p className="mt-6 text-xs text-[var(--muted)]">
        ※ 楽天市場のリンクはアフィリエイト ID を含みます（設定時のみ）。
      </p>

      <MarketplaceLinks keyword={keyword} />

      <section className="mt-8">
        <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-3">
          交換手順を動画で見る
        </h2>
        <a
          href={`https://www.youtube.com/results?search_query=${encodeURIComponent(`${part.name} 交換 取り付け`)}`}
          target="_blank"
          rel="noopener noreferrer"
          className="flex items-center gap-3 rounded-lg border border-[var(--card-border)] bg-[#fff3f3] px-4 py-3 hover:border-[var(--accent)]"
        >
          <span className="text-2xl shrink-0">▶️</span>
          <div className="min-w-0 flex-1">
            <div className="text-sm font-semibold text-red-700">
              YouTube で「{part.name} 交換」を検索
            </div>
            <div className="text-xs text-[var(--muted)] mt-0.5">
              実際の交換手順やコツを確認できます
            </div>
          </div>
          <span className="text-xs text-[var(--muted)] shrink-0">↗</span>
        </a>
      </section>

      {fitAppliances.length > 1 && (
        <section className="mt-10">
          <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-3">
            適合する他の機種（{fitAppliances.length}）
          </h2>
          <ul className="space-y-2">
            {fitAppliances.map((a) => (
              <li key={a.id}>
                <Link
                  href={`/appliance/${a.id}`}
                  className="block bg-[var(--card)] border border-[var(--card-border)] rounded-lg px-4 py-3 hover:border-[var(--accent)]"
                >
                  <div className="text-xs text-[var(--muted)]">{a.manufacturer}</div>
                  <div className="font-semibold mt-0.5">{a.model_number}</div>
                  {a.model_name && (
                    <div className="text-sm text-[var(--muted)] mt-0.5">{a.model_name}</div>
                  )}
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}
    </div>
  );
}
