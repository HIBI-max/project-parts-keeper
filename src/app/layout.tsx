import type { Metadata, Viewport } from "next";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import "./globals.css";

export const metadata: Metadata = {
  title: "Parts Keeper — 家電の部品を一発で見つける",
  description:
    "炊飯器の内釜、洗濯機のフィルター、リモコン、バッテリー。型番から純正・互換部品を検索して、楽天・Amazon の在庫と価格を横断比較。",
  applicationName: "Parts Keeper",
  metadataBase: new URL("https://project-parts-keeper.vercel.app"),
  openGraph: {
    title: "Parts Keeper — 家電の部品を一発で見つける",
    description:
      "型番から純正・互換部品を検索して、楽天・Amazon の在庫と価格を横断比較。",
    type: "website",
    locale: "ja_JP",
  },
  twitter: {
    card: "summary_large_image",
    title: "Parts Keeper — 家電の部品を一発で見つける",
    description: "まだ動く家電を、部品で延命する。",
  },
};

export const viewport: Viewport = {
  themeColor: "#2e6b69",
  width: "device-width",
  initialScale: 1,
  viewportFit: "cover",
};

export default async function RootLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  return (
    <html lang="ja" className="h-full antialiased">
      <body className="min-h-full flex flex-col">
        <header className="border-b border-[var(--card-border)] bg-[var(--card)]">
          <div className="mx-auto max-w-3xl px-4 py-3 flex items-center justify-between">
            <Link href="/" className="flex items-center gap-2">
              <span className="inline-flex w-7 h-7 rounded bg-[var(--accent)] items-center justify-center">
                <svg
                  width="18"
                  height="18"
                  viewBox="0 0 24 24"
                  fill="white"
                  aria-label="Parts Keeper"
                >
                  <title>Parts Keeper</title>
                  <path d="M17.65 6.35C16.2 4.9 14.21 4 12 4c-4.42 0-7.99 3.58-7.99 8s3.57 8 7.99 8c3.73 0 6.84-2.55 7.73-6h-2.08c-.82 2.33-3.04 4-5.65 4-3.31 0-6-2.69-6-6s2.69-6 6-6c1.66 0 3.14.69 4.22 1.78L13 11h7V4l-2.35 2.35z" />
                </svg>
              </span>
              <span className="font-semibold tracking-tight">Parts Keeper</span>
            </Link>
            <nav className="flex items-center gap-4 text-sm">
              <Link href="/search" className="text-[var(--accent-deep)] hover:underline">
                型番検索
              </Link>
              {user ? (
                <Link href="/my" className="text-[var(--accent-deep)] hover:underline">
                  マイ家電
                </Link>
              ) : (
                <Link href="/login" className="text-[var(--muted)] hover:text-[var(--accent-deep)]">
                  ログイン
                </Link>
              )}
            </nav>
          </div>
        </header>
        <main className="flex-1">{children}</main>
        <footer className="border-t border-[var(--card-border)] bg-[var(--card)] mt-12">
          <div className="mx-auto max-w-3xl px-4 py-6 text-xs text-[var(--muted)]">
            © Parts Keeper. 部品データはユーザー投稿とメーカー公式情報に基づいています。
          </div>
        </footer>
      </body>
    </html>
  );
}
