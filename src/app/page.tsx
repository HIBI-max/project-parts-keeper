import Link from "next/link";
import { SearchInput } from "@/components/SearchInput";
import { APPLIANCE_CATEGORY_LABEL } from "@/lib/format";
import { createClient } from "@/lib/supabase/server";

interface CategoryStat {
  category: string;
  count: number;
}

export default async function HomePage() {
  const supabase = await createClient();

  // カテゴリ別件数（verified のみ集計、unverified は静的に対応カテゴリ表示済なので別途）
  const { data: catData } = await supabase
    .from("appliances")
    .select("category")
    .eq("is_verified", true);
  const categoryCounts = new Map<string, number>();
  for (const r of catData ?? []) {
    categoryCounts.set(r.category, (categoryCounts.get(r.category) ?? 0) + 1);
  }
  const categoryStats: CategoryStat[] = [
    "rice_cooker",
    "washing_machine",
    "vacuum",
    "air_conditioner",
    "microwave",
    "refrigerator",
    "air_purifier",
  ].map((c) => ({ category: c, count: categoryCounts.get(c) ?? 0 }));

  // お気に入り数の多い人気機種 (上位 6)
  const { data: popularData } = await supabase
    .from("favorites")
    .select("appliance_id, appliances!inner (id, manufacturer, model_number, model_name, category)")
    .eq("appliances.is_verified", true)
    .limit(100);
  interface PopRow {
    appliance_id: string;
    appliances: {
      id: string;
      manufacturer: string;
      model_number: string;
      model_name: string | null;
      category: string;
    } | null;
  }
  const popCounts = new Map<string, { row: PopRow["appliances"]; count: number }>();
  for (const r of (popularData ?? []) as unknown as PopRow[]) {
    if (!r.appliances) continue;
    const key = r.appliances.id;
    const prev = popCounts.get(key);
    if (prev) prev.count++;
    else popCounts.set(key, { row: r.appliances, count: 1 });
  }
  const popular = [...popCounts.values()]
    .sort((a, b) => b.count - a.count)
    .slice(0, 6)
    .map((p) => p.row)
    .filter((r): r is NonNullable<typeof r> => r !== null);

  return (
    <div className="mx-auto max-w-3xl px-4 py-10">
      <section className="text-center py-10">
        <h1 className="text-3xl sm:text-4xl font-bold tracking-tight">
          まだ動く家電を、<br />
          <span className="text-[var(--accent-deep)]">部品で延命する。</span>
        </h1>
        <p className="mt-4 text-[var(--muted)] text-sm sm:text-base leading-relaxed">
          炊飯器の内釜、洗濯機のフィルター、リモコン、バッテリー。
          <br />
          型番を入れるだけで、純正・互換パーツを楽天で横断検索。
        </p>
      </section>

      <div className="bg-[var(--card)] border border-[var(--card-border)] rounded-xl p-4 sm:p-5 shadow-sm">
        <div className="text-xs font-semibold text-[var(--muted)] uppercase tracking-wider mb-2">
          家電の型番
        </div>
        <SearchInput placeholder="例: SR-MPA101 / NW-JZ10 / NR-F507WPX" />
        <p className="mt-3 text-xs text-[var(--muted)]">
          型番は家電本体の背面や底面のラベルに記載されています。
        </p>

        <div className="mt-4 pt-4 border-t border-[var(--card-border)] text-center">
          <Link
            href="/scan"
            className="inline-flex items-center gap-1.5 text-sm font-medium text-[var(--accent-deep)] hover:underline"
          >
            📷 カメラで型番を読み取る
          </Link>
        </div>
      </div>

      <section className="mt-10">
        <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-3">
          カテゴリから探す
        </h2>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
          {categoryStats.map((c) => (
            <Link
              key={c.category}
              href={`/category/${c.category}`}
              className="bg-[var(--card)] border border-[var(--card-border)] rounded-lg p-3 text-center hover:border-[var(--accent)] transition-colors"
            >
              <div className="font-semibold">
                {APPLIANCE_CATEGORY_LABEL[c.category] ?? c.category}
              </div>
              <div className="text-xs text-[var(--muted)] mt-1">{c.count} 機種</div>
            </Link>
          ))}
        </div>
      </section>

      {popular.length > 0 && (
        <section className="mt-10">
          <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-3">
            🔥 みんなが見ている機種
          </h2>
          <ul className="space-y-2">
            {popular.map((p) => (
              <li key={p.id}>
                <Link
                  href={`/appliance/${p.id}`}
                  className="block bg-[var(--card)] border border-[var(--card-border)] rounded-lg px-4 py-3 hover:border-[var(--accent)]"
                >
                  <div className="text-xs text-[var(--muted)]">
                    {p.manufacturer} ·{" "}
                    {APPLIANCE_CATEGORY_LABEL[p.category] ?? p.category}
                  </div>
                  <div className="font-semibold mt-0.5">{p.model_number}</div>
                  {p.model_name && (
                    <div className="text-sm text-[var(--muted)] mt-0.5">{p.model_name}</div>
                  )}
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      <section className="mt-10 text-center">
        <Link
          href="/blog"
          className="text-sm text-[var(--accent-deep)] underline underline-offset-4"
        >
          📝 修理・部品保守の読み物を見る
        </Link>
      </section>
    </div>
  );
}
