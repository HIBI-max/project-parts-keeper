import Link from "next/link";
import { redirect } from "next/navigation";
import { FavoriteMetaForm } from "@/components/FavoriteMetaForm";
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

  // 未読通知
  const { data: notifsData } = await supabase
    .from("notifications")
    .select("id, kind, title, body, url, created_at")
    .is("read_at", null)
    .order("created_at", { ascending: false })
    .limit(10);
  interface Notif {
    id: string;
    kind: string;
    title: string;
    body: string | null;
    url: string | null;
    created_at: string;
  }
  const notifications = (notifsData ?? []) as Notif[];

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

      {notifications.length > 0 && (
        <section className="mt-6">
          <h2 className="text-xs font-semibold text-[var(--muted)] uppercase tracking-wider mb-2">
            通知 ({notifications.length})
          </h2>
          <ul className="space-y-2">
            {notifications.map((n) => (
              <li
                key={n.id}
                className={`rounded-lg border px-4 py-3 ${
                  n.kind === "eol_expired"
                    ? "bg-[var(--warn)]/10 border-[var(--warn)]/30"
                    : "bg-yellow-50 border-yellow-200"
                }`}
              >
                <div className="font-semibold text-sm">
                  {n.kind === "eol_expired" ? "⚠️ " : "📢 "}
                  {n.title}
                </div>
                {n.body && <div className="mt-1 text-xs text-[var(--muted)]">{n.body}</div>}
                {n.url && (
                  <Link
                    href={n.url}
                    className="mt-2 inline-block text-xs text-[var(--accent-deep)] underline"
                  >
                    詳細を見る
                  </Link>
                )}
              </li>
            ))}
          </ul>
        </section>
      )}

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
              <li
                key={a.id}
                className="bg-[var(--card)] border border-[var(--card-border)] rounded-lg p-4"
              >
                <div className="flex items-start justify-between gap-2">
                  <Link href={`/appliance/${a.id}`} className="min-w-0 flex-1 hover:opacity-80">
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
                    {f.purchased_at && (
                      <div className="text-xs text-[var(--muted)] mt-0.5">
                        購入日: {f.purchased_at}
                      </div>
                    )}
                  </Link>
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
                <FavoriteMetaForm
                  applianceId={a.id}
                  initialNickname={f.nickname}
                  initialPurchasedAt={f.purchased_at}
                />
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
}
