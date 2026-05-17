"use client";

import Link from "next/link";
import { useState } from "react";
import { createClient } from "@/lib/supabase/client";

export default function LoginPage() {
  const [email, setEmail] = useState("");
  const [status, setStatus] = useState<"idle" | "sending" | "sent" | "error">("idle");
  const [error, setError] = useState<string | null>(null);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setStatus("sending");
    setError(null);

    const supabase = createClient();
    const origin = window.location.origin;
    const { error } = await supabase.auth.signInWithOtp({
      email,
      options: {
        emailRedirectTo: `${origin}/auth/callback`,
      },
    });
    if (error) {
      setError(error.message);
      setStatus("error");
    } else {
      setStatus("sent");
    }
  }

  return (
    <div className="mx-auto max-w-md px-4 py-10">
      <Link href="/" className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]">
        ← トップへ
      </Link>

      <h1 className="mt-3 text-2xl font-bold">ログイン</h1>
      <p className="mt-2 text-sm text-[var(--muted)]">
        メールアドレスにログイン用リンクをお送りします（パスワード不要）。
      </p>

      {status === "sent" ? (
        <div className="mt-6 rounded-lg bg-[var(--accent)]/10 border border-[var(--accent)]/30 px-4 py-4 text-sm">
          <div className="font-semibold text-[var(--accent-deep)]">📨 メールを送信しました</div>
          <div className="mt-2 text-[var(--muted)]">
            {email} の受信箱を確認し、リンクをクリックしてください。
          </div>
        </div>
      ) : (
        <form
          onSubmit={handleSubmit}
          className="mt-6 bg-[var(--card)] border border-[var(--card-border)] rounded-xl p-5"
        >
          <label htmlFor="email" className="text-xs font-semibold text-[var(--muted)] uppercase">
            メールアドレス
          </label>
          <input
            id="email"
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
            placeholder="you@example.com"
            className="mt-2 w-full px-3 py-2.5 rounded-lg border border-[var(--card-border)] bg-white focus:outline-none focus:ring-2 focus:ring-[var(--accent)]"
            disabled={status === "sending"}
          />
          <button
            type="submit"
            disabled={status === "sending"}
            className="mt-4 w-full px-5 py-2.5 rounded-lg bg-[var(--accent)] text-white font-medium hover:bg-[var(--accent-deep)] disabled:opacity-50"
          >
            {status === "sending" ? "送信中…" : "ログインリンクを送る"}
          </button>
          {error && (
            <p className="mt-3 text-sm text-red-700 bg-red-50 border border-red-200 rounded px-3 py-2">
              {error}
            </p>
          )}
        </form>
      )}
    </div>
  );
}
