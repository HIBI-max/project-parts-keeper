import type { Metadata, Viewport } from "next";
import Link from "next/link";
import "./globals.css";

export const metadata: Metadata = {
  title: "Parts Keeper — 家電の部品を一発で見つける",
  description:
    "炊飯器の内釜、洗濯機のフィルター、リモコン、バッテリー。型番から純正・互換部品を検索して、楽天・Amazon の在庫と価格を横断比較。",
  applicationName: "Parts Keeper",
};

export const viewport: Viewport = {
  themeColor: "#2e6b69",
  width: "device-width",
  initialScale: 1,
  viewportFit: "cover",
};

export default function RootLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
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
            <Link
              href="/search"
              className="text-sm text-[var(--accent-deep)] hover:underline"
            >
              型番から探す
            </Link>
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
