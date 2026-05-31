import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { APPLIANCE_CATEGORY_LABEL } from "@/lib/format";
import { createClient } from "@/lib/supabase/server";

type ApplianceCategory =
  | "rice_cooker"
  | "washing_machine"
  | "vacuum"
  | "air_conditioner"
  | "microwave"
  | "refrigerator"
  | "air_purifier";

const VALID_CATEGORIES: ApplianceCategory[] = [
  "rice_cooker",
  "washing_machine",
  "vacuum",
  "air_conditioner",
  "microwave",
  "refrigerator",
  "air_purifier",
];

function isValidCategory(s: string): s is ApplianceCategory {
  return (VALID_CATEGORIES as string[]).includes(s);
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ name: string }>;
}): Promise<Metadata> {
  const { name } = await params;
  const label = APPLIANCE_CATEGORY_LABEL[name] ?? name;
  return {
    title: `${label}の交換部品 — Parts Keeper`,
    description: `${label}の機種から純正・互換部品を検索。メーカー別・型番別に対応部品を一覧表示。`,
  };
}

interface Appliance {
  id: string;
  manufacturer: string;
  model_number: string;
  model_name: string | null;
  parts_retention_until: number | null;
  is_verified: boolean;
}

export default async function CategoryPage({
  params,
}: {
  params: Promise<{ name: string }>;
}) {
  const { name } = await params;
  if (!isValidCategory(name)) notFound();

  const supabase = await createClient();
  const { data, count } = await supabase
    .from("appliances")
    .select(
      "id, manufacturer, model_number, model_name, parts_retention_until, is_verified",
      { count: "exact" },
    )
    .eq("category", name)
    .order("is_verified", { ascending: false })
    .order("manufacturer")
    .order("model_number")
    .limit(200);

  const appliances = (data ?? []) as Appliance[];
  const label = APPLIANCE_CATEGORY_LABEL[name] ?? name;
  const now = new Date().getFullYear();

  // メーカー別グルーピング
  const byMfg = new Map<string, Appliance[]>();
  for (const a of appliances) {
    const g = byMfg.get(a.manufacturer) ?? [];
    g.push(a);
    byMfg.set(a.manufacturer, g);
  }

  return (
    <div className="mx-auto max-w-3xl px-4 py-6">
      <Link href="/" className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]">
        ← トップへ
      </Link>

      <h1 className="mt-3 text-2xl font-bold">{label}の部品</h1>
      <p className="mt-1 text-sm text-[var(--muted)]">
        {count ?? appliances.length} 機種（{appliances.filter((a) => a.is_verified).length}{" "}
        機種で部品確認済）
      </p>

      <div className="mt-6 space-y-6">
        {[...byMfg.entries()].map(([mfg, items]) => (
          <section key={mfg}>
            <h2 className="text-xs font-semibold text-[var(--muted)] uppercase tracking-wider mb-2">
              {mfg} ({items.length})
            </h2>
            <ul className="space-y-2">
              {items.map((a) => {
                const eol =
                  a.parts_retention_until != null && a.parts_retention_until < now;
                return (
                  <li key={a.id}>
                    <Link
                      href={`/appliance/${a.id}`}
                      className={`block bg-[var(--card)] border border-[var(--card-border)] rounded-lg px-4 py-3 hover:border-[var(--accent)] ${
                        a.is_verified ? "" : "opacity-70"
                      }`}
                    >
                      <div className="flex items-start justify-between gap-2">
                        <div className="min-w-0">
                          <div className="font-semibold">{a.model_number}</div>
                          {a.model_name && (
                            <div className="text-sm text-[var(--muted)] mt-0.5">
                              {a.model_name}
                            </div>
                          )}
                        </div>
                        <div className="shrink-0 flex flex-col items-end gap-1">
                          {eol && (
                            <span className="text-xs px-2 py-0.5 rounded bg-[var(--warn)]/10 text-[var(--warn)] border border-[var(--warn)]/30">
                              保有期間終了
                            </span>
                          )}
                          {!a.is_verified && (
                            <span className="text-xs px-2 py-0.5 rounded bg-gray-100 text-gray-600 border border-gray-200">
                              簡易
                            </span>
                          )}
                        </div>
                      </div>
                    </Link>
                  </li>
                );
              })}
            </ul>
          </section>
        ))}
      </div>

      {(count ?? 0) > appliances.length && (
        <p className="mt-6 text-xs text-center text-[var(--muted)]">
          先頭 {appliances.length} 件を表示しています。型番で絞り込んでください。
        </p>
      )}
    </div>
  );
}
