import Link from "next/link";
import { SearchInput } from "@/components/SearchInput";

export default function HomePage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-10">
      <section className="text-center py-10">
        <h1 className="text-3xl sm:text-4xl font-bold tracking-tight">
          まだ動く家電を、<br />
          <span className="text-[var(--accent-deep)]">部品で延命する。</span>
        </h1>
        <p className="mt-4 text-[var(--muted)] text-sm sm:text-base leading-relaxed">
          炊飯器の内釜、洗濯機のフィルター、リモコン、バッテリー。
          <br />
          型番を入れるだけで、純正・互換パーツを楽天で横断検索。
        </p>
      </section>

      <div className="bg-[var(--card)] border border-[var(--card-border)] rounded-xl p-4 sm:p-5 shadow-sm">
        <div className="text-xs font-semibold text-[var(--muted)] uppercase tracking-wider mb-2">
          家電の型番
        </div>
        <SearchInput placeholder="例: SR-MPA101 / NW-JZ10 / NR-F507WPX" />
        <p className="mt-3 text-xs text-[var(--muted)]">
          型番は家電本体の背面や底面のラベルに記載されています。
        </p>

        <div className="mt-4 pt-4 border-t border-[var(--card-border)] text-center">
          <Link
            href="/scan"
            className="inline-flex items-center gap-1.5 text-sm font-medium text-[var(--accent-deep)] hover:underline"
          >
            📷 カメラで型番を読み取る
          </Link>
        </div>
      </div>

      <section className="mt-10">
        <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-3">
          対応カテゴリ
        </h2>
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
          {[
            { label: "炊飯器", note: "内釜・蒸気ふた" },
            { label: "洗濯機", note: "フィルター・ホース" },
            { label: "掃除機", note: "バッテリー・ブラシ" },
            { label: "エアコン", note: "フィルター・リモコン" },
            { label: "電子レンジ", note: "ターンテーブル・パッキン" },
            { label: "冷蔵庫", note: "製氷皿・ドアパッキン" },
          ].map((c) => (
            <div
              key={c.label}
              className="bg-[var(--card)] border border-[var(--card-border)] rounded-lg p-3 text-center"
            >
              <div className="font-semibold">{c.label}</div>
              <div className="text-xs text-[var(--muted)] mt-1">{c.note}</div>
            </div>
          ))}
        </div>
      </section>

      <section className="mt-10 text-center">
        <Link
          href="/search?q=SR-MPA"
          className="text-sm text-[var(--accent-deep)] underline underline-offset-4"
        >
          サンプル検索を試す（SR-MPA）
        </Link>
      </section>
    </div>
  );
}
