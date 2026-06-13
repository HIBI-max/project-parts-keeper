import Link from "next/link";
import { SearchInput } from "@/components/SearchInput";
import { APPLIANCE_CATEGORY_LABEL } from "@/lib/format";
import { createClient } from "@/lib/supabase/server";

interface SearchParams {
  q?: string;
}

interface Appliance {
  id: string;
  slug: string;
  manufacturer: string;
  category: string;
  model_number: string;
  model_name: string | null;
  release_year: number | null;
  production_end_year: number | null;
  parts_retention_until: number | null;
  is_verified: boolean;
}

export default async function SearchPage({
  searchParams,
}: {
  searchParams: Promise<SearchParams>;
}) {
  const { q = "" } = await searchParams;
  const query = q.trim();
  const supabase = await createClient();

  let appliances: Appliance[] = [];
  let error: string | null = null;

  if (query) {
    const { data, error: dbErr } = await supabase
      .from("appliances")
      .select(
        "id, slug, manufacturer, category, model_number, model_name, release_year, production_end_year, parts_retention_until, is_verified",
      )
      .or(`model_number.ilike.%${query}%,model_name.ilike.%${query}%`)
      .order("is_verified", { ascending: false })
      .order("manufacturer", { ascending: true })
      .limit(100);

    if (dbErr) {
      error = dbErr.message;
    } else {
      appliances = (data ?? []) as Appliance[];
    }
  }

  const now = new Date().getFullYear();

  return (
    <div className="mx-auto max-w-3xl px-4 py-6">
      <div className="mb-6">
        <SearchInput initialValue={query} placeholder="型番を入力" />
      </div>

      {query && (
        <p className="text-sm text-[var(--muted)] mb-3">
          「{query}」の検索結果: {appliances.length} 件
        </p>
      )}

      {error && (
        <div className="rounded-lg bg-red-50 border border-red-200 px-4 py-3 text-sm text-red-800">
          DB エラー: {error}
        </div>
      )}

      {!query && (
        <div className="text-center py-12 text-[var(--muted)]">
          型番を入力してください
        </div>
      )}

      {query && !error && appliances.length === 0 && (
        <div className="text-center py-12 text-[var(--muted)]">
          一致する家電が見つかりませんでした。
          <br />
          <span className="text-xs">
            部品マスタは段階的に追加中です。型番の一部だけでも試してみてください。
          </span>
        </div>
      )}

      {(() => {
        // verified を先、unverified を後 (DB 側で sort 済み)
        // カテゴリ別グループ化
        const groups = new Map<string, Appliance[]>();
        for (const a of appliances) {
          const g = groups.get(a.category) ?? [];
          g.push(a);
          groups.set(a.category, g);
        }
        return [...groups.entries()].map(([category, items]) => (
          <section key={category} className="mb-6">
            <h2 className="text-xs font-semibold text-[var(--muted)] uppercase tracking-wider mb-2">
              {APPLIANCE_CATEGORY_LABEL[category] ?? category}
              <span className="ml-2 normal-case font-normal">({items.length})</span>
            </h2>
            <ul className="space-y-2">
              {items.map((a) => {
                const eol =
                  a.parts_retention_until != null && a.parts_retention_until < now;
                return (
                  <li key={a.id}>
                    <Link
                      href={`/appliance/${a.slug}`}
                      className={`block bg-[var(--card)] border border-[var(--card-border)] rounded-lg px-4 py-3 hover:border-[var(--accent)] transition-colors ${
                        a.is_verified ? "" : "opacity-70"
                      }`}
                    >
                      <div className="flex items-start justify-between gap-2">
                        <div className="min-w-0">
                          <div className="text-xs text-[var(--muted)]">{a.manufacturer}</div>
                          <div className="font-semibold mt-0.5">{a.model_number}</div>
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
                              簡易表示
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
        ));
      })()}
    </div>
  );
}
