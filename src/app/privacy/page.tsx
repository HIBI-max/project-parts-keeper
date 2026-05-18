import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "プライバシーポリシー — Parts Keeper",
  description: "Parts Keeper の個人情報の取り扱いについて",
};

export default function PrivacyPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-8 prose-sm">
      <Link href="/" className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]">
        ← トップへ
      </Link>
      <h1 className="mt-3 text-2xl font-bold">プライバシーポリシー</h1>
      <p className="mt-2 text-xs text-[var(--muted)]">最終更新日: 2026 年 5 月 18 日</p>

      <section className="mt-6 space-y-6 text-sm leading-relaxed">
        <div>
          <h2 className="font-semibold text-base mb-2">1. 取得する情報</h2>
          <p>
            Parts Keeper は以下の情報を取得することがあります。
          </p>
          <ul className="list-disc pl-5 mt-2 space-y-1">
            <li>メールアドレス（ログイン時に入力された場合）</li>
            <li>登録した家電の型番・購入日等の情報</li>
            <li>アクセスログ（IP アドレス、User-Agent 等）</li>
          </ul>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">2. 利用目的</h2>
          <ul className="list-disc pl-5 space-y-1">
            <li>ログイン認証およびマイ家電機能の提供</li>
            <li>部品保有期間切れ等の通知の送信</li>
            <li>サービスの品質向上のための統計分析</li>
          </ul>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">3. 第三者への提供</h2>
          <p>
            法令に基づく場合を除き、本人の同意なく第三者に個人情報を提供することはありません。
            ただし、以下の外部サービスへリンクする際にブラウザから自動送信される情報（リファラ等）が
            あります。
          </p>
          <ul className="list-disc pl-5 mt-2 space-y-1">
            <li>楽天市場 (アフィリエイトリンク)</li>
            <li>Amazon (アソシエイトリンク)</li>
            <li>Yahoo!ショッピング、メルカリ、ヤフオク (検索リンク)</li>
            <li>YouTube (動画検索リンク)</li>
          </ul>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">4. データの保管・削除</h2>
          <p>
            アカウント削除をご希望の場合は <Link href="/contact" className="text-[var(--accent-deep)] underline">お問い合わせ</Link> よりご連絡ください。
            関連する個人データを速やかに削除します。
          </p>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">5. アフィリエイトプログラムについて</h2>
          <p>
            本サイトは Amazon.co.jp を宣伝しリンクすることによってサイトが紹介料を獲得できる
            手段を提供することを目的に設定された Amazon アソシエイト・プログラムの参加者です。
            また楽天アフィリエイト等の各種アフィリエイトプログラムにも参加しています。
          </p>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">6. お問い合わせ</h2>
          <p>
            本ポリシーに関するお問い合わせは <Link href="/contact" className="text-[var(--accent-deep)] underline">お問い合わせページ</Link> よりお願いします。
          </p>
        </div>
      </section>
    </div>
  );
}
