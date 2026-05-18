import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "特定商取引法に基づく表記 — Parts Keeper",
};

export default function CommercePage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      <Link href="/" className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]">
        ← トップへ
      </Link>
      <h1 className="mt-3 text-2xl font-bold">特定商取引法に基づく表記</h1>

      <p className="mt-4 text-sm text-[var(--muted)] leading-relaxed">
        本サイトは家電交換部品の検索情報を提供する無料サービスです。サイト運営者は楽天アフィリエイト、
        Amazon アソシエイト等のアフィリエイトプログラムを通じて紹介料を得ることがありますが、
        本サイト上で直接の商品販売は行いません。
      </p>

      <dl className="mt-6 grid grid-cols-1 sm:grid-cols-[160px_1fr] gap-y-3 gap-x-4 text-sm">
        <dt className="font-semibold text-[var(--muted)]">サイト名</dt>
        <dd>Parts Keeper</dd>

        <dt className="font-semibold text-[var(--muted)]">運営責任者</dt>
        <dd>個人開発者（連絡先は下記）</dd>

        <dt className="font-semibold text-[var(--muted)]">連絡先</dt>
        <dd>
          <Link href="/contact" className="text-[var(--accent-deep)] underline">
            お問い合わせフォーム
          </Link>
        </dd>

        <dt className="font-semibold text-[var(--muted)]">提供サービス</dt>
        <dd>家電交換部品の検索情報の提供（無料）</dd>

        <dt className="font-semibold text-[var(--muted)]">利用料金</dt>
        <dd>無料</dd>

        <dt className="font-semibold text-[var(--muted)]">商品の販売</dt>
        <dd>
          本サイトでは商品の直接販売は行っていません。リンク先の各 EC サイト（楽天市場、Amazon 等）
          での購入は、各サイトの規約に従います。
        </dd>
      </dl>
    </div>
  );
}
