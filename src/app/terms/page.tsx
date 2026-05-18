import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "利用規約 — Parts Keeper",
  description: "Parts Keeper のサービス利用規約",
};

export default function TermsPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      <Link href="/" className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]">
        ← トップへ
      </Link>
      <h1 className="mt-3 text-2xl font-bold">利用規約</h1>
      <p className="mt-2 text-xs text-[var(--muted)]">最終更新日: 2026 年 5 月 18 日</p>

      <section className="mt-6 space-y-6 text-sm leading-relaxed">
        <div>
          <h2 className="font-semibold text-base mb-2">第1条（サービス）</h2>
          <p>
            Parts Keeper（以下「本サービス」）は家電製品の交換部品情報を提供する Web サービスです。
            部品情報は楽天市場 API およびユーザー投稿により収集されたものであり、運営者が網羅性・
            正確性を保証するものではありません。
          </p>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">第2条（適合性・正確性）</h2>
          <p>
            表示される部品の「適合機種」情報は参考情報です。実際の購入前にはメーカー公式の
            部品検索ページや販売者の商品ページで適合性を必ずご確認ください。誤った部品の購入による
            損害について運営者は責任を負いません。
          </p>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">第3条（外部リンク）</h2>
          <p>
            本サービスは楽天市場、Amazon、Yahoo!ショッピング、メルカリ、ヤフオク、YouTube 等の
            外部サービスへのリンクを含みます。これらのサービスでの取引・利用に関しては各サービスの
            規約に従ってください。
          </p>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">第4条（免責）</h2>
          <p>
            本サービスはベストエフォートで提供されます。データの誤り、リンク先サイトの仕様変更、
            サービス停止等によるいかなる損害についても運営者は責任を負いません。
          </p>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">第5条（禁止事項）</h2>
          <ul className="list-disc pl-5 space-y-1">
            <li>本サービスの DB を自動収集する行為（スクレイピング）</li>
            <li>他者の権利を侵害する行為</li>
            <li>本サービスの運営を妨げる行為</li>
          </ul>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">第6条（規約変更）</h2>
          <p>
            本規約は予告なく変更されることがあります。変更後の規約はサイト上で告知された時点から
            適用されます。
          </p>
        </div>
      </section>
    </div>
  );
}
