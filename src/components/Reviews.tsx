"use client";

import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";

interface Review {
  id: string;
  user_id: string;
  rating: number | null;
  body: string;
  created_at: string;
}

interface Props {
  target: "part" | "appliance";
  targetId: string;
}

export function Reviews({ target, targetId }: Props) {
  const router = useRouter();
  const [reviews, setReviews] = useState<Review[]>([]);
  const [currentUserId, setCurrentUserId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [open, setOpen] = useState(false);
  const [body, setBody] = useState("");
  const [rating, setRating] = useState<number>(0);
  const [submitting, setSubmitting] = useState(false);

  const idColumn = target === "part" ? "part_id" : "appliance_id";

  useEffect(() => {
    const supabase = createClient();
    (async () => {
      const [reviewsRes, userRes] = await Promise.all([
        supabase
          .from("reviews")
          .select("id, user_id, rating, body, created_at")
          .eq(idColumn, targetId)
          .order("created_at", { ascending: false })
          .limit(50),
        supabase.auth.getUser(),
      ]);
      setReviews((reviewsRes.data ?? []) as Review[]);
      setCurrentUserId(userRes.data.user?.id ?? null);
      setLoading(false);
    })();
  }, [targetId, idColumn]);

  async function submit() {
    if (!body.trim()) return;
    setSubmitting(true);
    const supabase = createClient();
    const {
      data: { user },
    } = await supabase.auth.getUser();
    if (!user) {
      router.push("/login");
      return;
    }
    const payload: {
      user_id: string;
      target: "part" | "appliance";
      part_id: string | null;
      appliance_id: string | null;
      rating: number | null;
      body: string;
    } = {
      user_id: user.id,
      target,
      part_id: target === "part" ? targetId : null,
      appliance_id: target === "appliance" ? targetId : null,
      rating: rating > 0 ? rating : null,
      body: body.trim(),
    };
    const { data, error } = await supabase
      .from("reviews")
      .insert(payload)
      .select("id, user_id, rating, body, created_at")
      .single();
    if (!error && data) {
      setReviews((prev) => [data as Review, ...prev]);
      setBody("");
      setRating(0);
      setOpen(false);
    }
    setSubmitting(false);
  }

  async function remove(id: string) {
    if (!confirm("削除しますか？")) return;
    const supabase = createClient();
    await supabase.from("reviews").delete().eq("id", id);
    setReviews((prev) => prev.filter((r) => r.id !== id));
  }

  return (
    <section className="mt-10">
      <div className="flex items-center justify-between mb-3">
        <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider">
          ユーザー投稿 ({reviews.length})
        </h2>
        {currentUserId ? (
          <button
            type="button"
            onClick={() => setOpen((o) => !o)}
            className="text-xs text-[var(--accent-deep)] hover:underline"
          >
            {open ? "閉じる" : "✏️ 投稿する"}
          </button>
        ) : (
          <a
            href={`/login?next=${encodeURIComponent(typeof window === "undefined" ? "" : window.location.pathname)}`}
            className="text-xs text-[var(--accent-deep)] hover:underline"
          >
            ログインして投稿
          </a>
        )}
      </div>

      {open && currentUserId && (
        <div className="mb-4 p-4 bg-[var(--card)] border border-[var(--card-border)] rounded-lg space-y-3">
          <div>
            <label className="text-xs font-semibold text-[var(--muted)]">評価（任意）</label>
            <div className="mt-1 flex gap-1">
              {[1, 2, 3, 4, 5].map((n) => (
                <button
                  key={n}
                  type="button"
                  onClick={() => setRating(rating === n ? 0 : n)}
                  className={`text-2xl ${n <= rating ? "text-yellow-400" : "text-gray-300"}`}
                >
                  ★
                </button>
              ))}
            </div>
          </div>
          <div>
            <label className="text-xs font-semibold text-[var(--muted)]">本文</label>
            <textarea
              value={body}
              onChange={(e) => setBody(e.target.value)}
              maxLength={2000}
              rows={4}
              placeholder="修理体験談、適合確認情報、互換情報など"
              className="mt-1 w-full px-2 py-1.5 rounded border border-[var(--card-border)] bg-white text-sm focus:outline-none focus:ring-2 focus:ring-[var(--accent)]"
            />
            <div className="text-xs text-[var(--muted)] mt-1 text-right">{body.length} / 2000</div>
          </div>
          <button
            type="button"
            onClick={submit}
            disabled={submitting || !body.trim()}
            className="px-4 py-2 rounded-lg bg-[var(--accent)] text-white text-sm font-medium hover:bg-[var(--accent-deep)] disabled:opacity-50"
          >
            {submitting ? "投稿中…" : "投稿する"}
          </button>
        </div>
      )}

      {loading ? (
        <p className="text-sm text-[var(--muted)]">読み込み中…</p>
      ) : reviews.length === 0 ? (
        <p className="text-sm text-[var(--muted)]">
          まだ投稿はありません。最初の投稿者になってください。
        </p>
      ) : (
        <ul className="space-y-3">
          {reviews.map((r) => (
            <li key={r.id} className="bg-[var(--card)] border border-[var(--card-border)] rounded-lg p-3">
              <div className="flex items-center justify-between text-xs text-[var(--muted)]">
                <div className="flex items-center gap-2">
                  {r.rating != null && (
                    <span className="text-yellow-500">
                      {"★".repeat(r.rating)}
                      {"☆".repeat(5 - r.rating)}
                    </span>
                  )}
                  <span>{new Date(r.created_at).toLocaleDateString("ja-JP")}</span>
                </div>
                {currentUserId === r.user_id && (
                  <button
                    type="button"
                    onClick={() => remove(r.id)}
                    className="text-red-600 hover:underline"
                  >
                    削除
                  </button>
                )}
              </div>
              <p className="mt-2 text-sm whitespace-pre-wrap break-words">{r.body}</p>
            </li>
          ))}
        </ul>
      )}
    </section>
  );
}
