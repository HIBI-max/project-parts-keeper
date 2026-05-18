import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "お問い合わせ — Parts Keeper",
};

export default function ContactPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-8">
      <Link href="/" className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]">
        ← トップへ
      </Link>
      <h1 className="mt-3 text-2xl font-bold">お問い合わせ</h1>

      <section className="mt-6 space-y-6 text-sm leading-relaxed">
        <div>
          <h2 className="font-semibold text-base mb-2">データの誤り報告</h2>
          <p>
            部品の適合機種や品番に誤りを見つけた場合、ぜひお知らせください。実際の家電オーナー様からの
            情報がデータベース品質の根幹です。
          </p>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">サポート・要望・取材</h2>
          <p>以下のメールアドレスへご連絡ください：</p>
          <p className="mt-2 font-mono text-base bg-[var(--card)] border border-[var(--card-border)] rounded px-3 py-2 inline-block">
            contact@parts-keeper.example
          </p>
          <p className="mt-2 text-xs text-[var(--muted)]">
            ※ 本番運用時は実際のメールアドレスに置き換えてください。
          </p>
        </div>

        <div>
          <h2 className="font-semibold text-base mb-2">含めていただきたい情報</h2>
          <ul className="list-disc pl-5 space-y-1">
            <li>機種型番 (例: SR-MPA101)</li>
            <li>部品名 (例: 内釜)</li>
            <li>正しいメーカー品番 (もしご存じなら)</li>
            <li>該当ページの URL</li>
          </ul>
        </div>
      </section>
    </div>
  );
}
