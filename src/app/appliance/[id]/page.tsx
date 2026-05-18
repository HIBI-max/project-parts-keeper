import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import { FavoriteButton } from "@/components/FavoriteButton";
import { APPLIANCE_CATEGORY_LABEL, PART_CATEGORY_LABEL } from "@/lib/format";
import { createClient } from "@/lib/supabase/server";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ id: string }>;
}): Promise<Metadata> {
  const { id } = await params;
  const supabase = await createClient();
  const { data } = await supabase
    .from("appliances")
    .select("manufacturer, model_number, model_name, category, parts_retention_until")
    .eq("id", id)
    .maybeSingle();

  if (!data) return { title: "見つかりませんでした — Parts Keeper" };

  const catLabel = APPLIANCE_CATEGORY_LABEL[data.category] ?? data.category;
  const title = `${data.manufacturer} ${data.model_number} の交換部品 — Parts Keeper`;
  const eolNote = data.parts_retention_until
    ? `部品保有期間 ${data.parts_retention_until} 年まで。`
    : "";
  const description = `${data.manufacturer} ${catLabel} ${data.model_number}${data.model_name ? ` (${data.model_name})` : ""} に対応する純正・互換部品を楽天市場・Amazon・メルカリで横断検索。${eolNote}`;

  return {
    title,
    description,
    openGraph: { title, description },
    twitter: { title, description, card: "summary_large_image" },
  };
}

interface ApplianceRow {
  id: string;
  manufacturer: string;
  category: string;
  model_number: string;
  model_name: string | null;
  release_year: number | null;
  production_end_year: number | null;
  parts_retention_until: number | null;
  notes: string | null;
  is_verified: boolean;
}

interface AppliancePartRow {
  fitment_note: string | null;
  parts: {
    id: string;
    name: string;
    category: string;
    kind: string;
    manufacturer: string | null;
    manufacturer_part_number: string | null;
    image_url: string | null;
  } | null;
}

export default async function AppliancePage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const supabase = await createClient();

  const { data: appliance } = await supabase
    .from("appliances")
    .select(
      "id, manufacturer, category, model_number, model_name, release_year, production_end_year, parts_retention_until, notes, is_verified",
    )
    .eq("id", id)
    .maybeSingle();

  if (!appliance) notFound();
  const a = appliance as ApplianceRow;

  const { data: partsData } = await supabase
    .from("appliance_parts")
    .select(
      "fitment_note, parts (id, name, category, kind, manufacturer, manufacturer_part_number, image_url)",
    )
    .eq("appliance_id", id);

  const parts = (partsData ?? []) as unknown as AppliancePartRow[];
  const now = new Date().getFullYear();
  const eol = a.parts_retention_until != null && a.parts_retention_until < now;

  // JSON-LD 構造化データ
  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "Product",
    name: `${a.manufacturer} ${a.model_number}`,
    description: a.model_name ?? undefined,
    brand: { "@type": "Brand", name: a.manufacturer },
    category: APPLIANCE_CATEGORY_LABEL[a.category] ?? a.category,
    sku: a.model_number,
    productionDate: a.release_year ? `${a.release_year}-01-01` : undefined,
    additionalProperty: a.parts_retention_until
      ? [
          {
            "@type": "PropertyValue",
            name: "部品保有期間",
            value: `${a.parts_retention_until} 年まで`,
          },
        ]
      : undefined,
  };

  return (
    <div className="mx-auto max-w-3xl px-4 py-6">
      {/* biome-ignore lint/security/noDangerouslySetInnerHtml: JSON-LD は SEO 必須 */}
      <script
        type="application/ld+json"
        // biome-ignore lint/security/noDangerouslySetInnerHtml: same
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <Link
        href="/search"
        className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]"
      >
        ← 検索に戻る
      </Link>

      <section className="mt-3 bg-[var(--card)] border border-[var(--card-border)] rounded-xl p-5">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0">
            <div className="text-xs text-[var(--muted)]">
              {a.manufacturer} · {APPLIANCE_CATEGORY_LABEL[a.category] ?? a.category}
            </div>
            <h1 className="text-2xl font-bold mt-1">{a.model_number}</h1>
            {a.model_name && <div className="text-[var(--muted)] mt-1">{a.model_name}</div>}
          </div>
          <FavoriteButton applianceId={a.id} />
        </div>

        <dl className="mt-4 grid grid-cols-2 gap-y-2 gap-x-4 text-sm">
          {a.release_year && (
            <>
              <dt className="text-[var(--muted)]">発売年</dt>
              <dd>{a.release_year}</dd>
            </>
          )}
          {a.production_end_year && (
            <>
              <dt className="text-[var(--muted)]">生産終了</dt>
              <dd>{a.production_end_year}</dd>
            </>
          )}
          {a.parts_retention_until && (
            <>
              <dt className="text-[var(--muted)]">部品保有期間</dt>
              <dd className={eol ? "text-[var(--warn)] font-medium" : ""}>
                {a.parts_retention_until} まで
                {eol && "（終了）"}
              </dd>
            </>
          )}
        </dl>

        {eol && (
          <div className="mt-4 rounded-lg bg-[var(--warn)]/10 border border-[var(--warn)]/30 px-3 py-2 text-sm text-[var(--warn)]">
            メーカーの部品保有期間は終了しています。互換品・中古部品・代替品の検討を推奨します。
          </div>
        )}

        {a.notes && (
          <p className="mt-4 text-sm text-[var(--muted)]">{a.notes}</p>
        )}

        {!a.is_verified && (
          <div className="mt-4 rounded-lg bg-gray-50 border border-gray-200 px-3 py-2 text-xs text-[var(--muted)]">
            この機種は自動収集された候補で、楽天市場での部品単体販売を確認できていません。
            正確な部品情報はメーカー公式の部品検索ページもご確認ください。
            メルカリ・ヤフオク等の中古サイトに在庫がある場合もあります。
          </div>
        )}
      </section>

      <h2 className="mt-8 mb-3 text-sm font-semibold text-[var(--muted)] uppercase tracking-wider">
        対応パーツ
      </h2>

      {parts.length === 0 ? (
        <div className="text-center py-8 text-sm text-[var(--muted)]">
          この機種の部品データはまだ登録されていません。
        </div>
      ) : (
        <ul className="space-y-2">
          {parts
            .filter((p) => p.parts)
            .map(({ parts: p, fitment_note }) => (
              <li key={p!.id}>
                <Link
                  href={`/part/${p!.id}`}
                  className="flex gap-3 bg-[var(--card)] border border-[var(--card-border)] rounded-lg p-3 hover:border-[var(--accent)] transition-colors"
                >
                  {p!.image_url ? (
                    <Image
                      src={p!.image_url}
                      alt=""
                      width={56}
                      height={56}
                      className="shrink-0 w-14 h-14 object-contain rounded border border-[var(--card-border)] bg-white"
                      unoptimized
                    />
                  ) : (
                    <div className="shrink-0 w-14 h-14 grid place-items-center rounded border border-dashed border-[var(--card-border)] text-[var(--muted)] text-2xl">
                      ⚙
                    </div>
                  )}
                  <div className="min-w-0 flex-1">
                    <div className="text-xs text-[var(--muted)]">
                      {PART_CATEGORY_LABEL[p!.category] ?? p!.category} ·{" "}
                      {p!.kind === "oem" ? "純正" : "互換"}
                    </div>
                    <div className="font-semibold mt-0.5 leading-snug">{p!.name}</div>
                    {p!.manufacturer_part_number && (
                      <div className="text-xs text-[var(--muted)] mt-0.5 font-mono">
                        {p!.manufacturer_part_number}
                      </div>
                    )}
                    {fitment_note && (
                      <div className="text-xs mt-1 text-[var(--accent-deep)]">
                        {fitment_note}
                      </div>
                    )}
                  </div>
                  <span className="self-center shrink-0 text-[var(--accent-deep)]">→</span>
                </Link>
              </li>
            ))}
        </ul>
      )}
    </div>
  );
}
