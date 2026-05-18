import type { Metadata } from "next";
import Link from "next/link";
import { BLOG_POSTS } from "@/lib/blog";

export const metadata: Metadata = {
  title: "ブログ — Parts Keeper",
  description: "家電の修理・部品保守・延命のための実用ガイド",
};

export default function BlogIndex() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-6">
      <Link href="/" className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]">
        ← トップへ
      </Link>
      <h1 className="mt-3 text-2xl font-bold">ブログ</h1>
      <p className="mt-1 text-sm text-[var(--muted)]">
        家電を長く使うための実用ガイドと修理ノウハウ
      </p>

      <ul className="mt-6 space-y-3">
        {BLOG_POSTS.map((p) => (
          <li key={p.slug}>
            <Link
              href={`/blog/${p.slug}`}
              className="block bg-[var(--card)] border border-[var(--card-border)] rounded-xl p-5 hover:border-[var(--accent)]"
            >
              <div className="text-xs text-[var(--muted)]">{p.publishedAt}</div>
              <h2 className="mt-1 font-bold text-lg leading-snug">{p.title}</h2>
              <p className="mt-2 text-sm text-[var(--muted)] leading-relaxed">
                {p.description}
              </p>
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
