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
              <span className="inline-block w-7 h-7 rounded bg-[var(--accent)] text-white text-sm font-bold grid place-items-center">
                PK
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
