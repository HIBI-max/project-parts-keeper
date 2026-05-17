import Link from "next/link";
import { redirect } from "next/navigation";
import { APPLIANCE_CATEGORY_LABEL } from "@/lib/format";
import { createClient } from "@/lib/supabase/server";

interface FavoriteRow {
  nickname: string | null;
  purchased_at: string | null;
  appliances: {
    id: string;
    manufacturer: string;
    model_number: string;
    model_name: string | null;
    category: string;
    parts_retention_until: number | null;
  } | null;
}

export default async function MyPage() {
  const supabase = await createClient();

  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/login");

  const { data } = await supabase
    .from("favorites")
    .select(
      "nickname, purchased_at, appliances (id, manufacturer, model_number, model_name, category, parts_retention_until)",
    )
    .order("created_at", { ascending: false });

  const favorites = ((data ?? []) as unknown as FavoriteRow[]).filter((f) => f.appliances);
  const now = new Date().getFullYear();

  return (
    <div className="mx-auto max-w-3xl px-4 py-6">
      <header className="flex items-baseline justify-between">
        <div>
          <h1 className="text-2xl font-bold">マイ家電</h1>
          <p className="text-xs text-[var(--muted)] mt-1">{user.email}</p>
        </div>
        <form action="/auth/signout" method="post">
          <button
            type="submit"
            className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]"
          >
            ログアウト
          </button>
        </form>
      </header>

      {favorites.length === 0 ? (
        <div className="mt-8 text-center py-10 text-sm text-[var(--muted)]">
          まだ登録された家電はありません。
          <br />
          <Link href="/search" className="text-[var(--accent-deep)] underline">
            型番から検索して登録
          </Link>
          してください。
        </div>
      ) : (
        <ul className="mt-6 space-y-2">
          {favorites.map((f) => {
            const a = f.appliances!;
            const eol =
              a.parts_retention_until != null && a.parts_retention_until < now;
            const yearsLeft =
              a.parts_retention_until != null ? a.parts_retention_until - now : null;
            return (
              <li key={a.id}>
                <Link
                  href={`/appliance/${a.id}`}
                  className="block bg-[var(--card)] border border-[var(--card-border)] rounded-lg px-4 py-3 hover:border-[var(--accent)]"
                >
                  <div className="flex items-start justify-between gap-2">
                    <div className="min-w-0">
                      <div className="text-xs text-[var(--muted)]">
                        {a.manufacturer} ·{" "}
                        {APPLIANCE_CATEGORY_LABEL[a.category] ?? a.category}
                      </div>
                      <div className="font-semibold mt-0.5">
                        {f.nickname ?? a.model_number}
                        {f.nickname && (
                          <span className="ml-2 text-xs text-[var(--muted)] font-normal">
                            ({a.model_number})
                          </span>
                        )}
                      </div>
                      {a.model_name && (
                        <div className="text-sm text-[var(--muted)] mt-0.5">{a.model_name}</div>
                      )}
                    </div>
                    {eol ? (
                      <span className="shrink-0 text-xs px-2 py-0.5 rounded bg-[var(--warn)]/10 text-[var(--warn)] border border-[var(--warn)]/30">
                        保有期間終了
                      </span>
                    ) : yearsLeft != null && yearsLeft <= 2 ? (
                      <span className="shrink-0 text-xs px-2 py-0.5 rounded bg-yellow-50 text-yellow-700 border border-yellow-200">
                        残り{yearsLeft}年
                      </span>
                    ) : null}
                  </div>
                </Link>
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
}
