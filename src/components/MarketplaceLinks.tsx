interface Props {
  /** 検索に使うキーワード (品番 or 部品名) */
  keyword: string;
}

interface Marketplace {
  name: string;
  label: string;
  emoji: string;
  search: (kw: string) => string;
  note?: string;
  bg: string;
  fg: string;
}

const MARKETPLACES: Marketplace[] = [
  {
    name: "mercari",
    label: "メルカリ",
    emoji: "🛍️",
    search: (kw) => `https://jp.mercari.com/search?keyword=${encodeURIComponent(kw)}`,
    note: "中古・未使用品",
    bg: "#fff5f7",
    fg: "#bf0021",
  },
  {
    name: "yahoo-auction",
    label: "ヤフオク",
    emoji: "🔨",
    search: (kw) =>
      `https://auctions.yahoo.co.jp/search/search?p=${encodeURIComponent(kw)}&fixed=1`,
    note: "中古・部品取り",
    bg: "#fef6ed",
    fg: "#a8420e",
  },
  {
    name: "yahoo-shopping",
    label: "Yahoo!ショッピング",
    emoji: "🛒",
    search: (kw) => `https://shopping.yahoo.co.jp/search?p=${encodeURIComponent(kw)}`,
    note: "新品",
    bg: "#fef7ec",
    fg: "#8c4a00",
  },
  {
    name: "amazon",
    label: "Amazon",
    emoji: "📦",
    search: (kw) => `https://www.amazon.co.jp/s?k=${encodeURIComponent(kw)}`,
    note: "新品",
    bg: "#fff7e6",
    fg: "#8a5300",
  },
];

export function MarketplaceLinks({ keyword }: Props) {
  return (
    <section className="mt-8">
      <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-3">
        他のサイトでも探す
      </h2>
      <div className="grid grid-cols-2 gap-2">
        {MARKETPLACES.map((mp) => (
          <a
            key={mp.name}
            href={mp.search(keyword)}
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center gap-2 rounded-lg border border-[var(--card-border)] px-3 py-3 hover:border-[var(--accent)] transition-colors"
            style={{ background: mp.bg }}
          >
            <span className="text-xl shrink-0">{mp.emoji}</span>
            <div className="min-w-0 flex-1">
              <div className="text-sm font-semibold" style={{ color: mp.fg }}>
                {mp.label}
              </div>
              {mp.note && (
                <div className="text-xs text-[var(--muted)] truncate">{mp.note}</div>
              )}
            </div>
            <span className="text-xs text-[var(--muted)] shrink-0">↗</span>
          </a>
        ))}
      </div>
      <p className="mt-3 text-xs text-[var(--muted)]">
        ※ メーカー製造終了の機種は中古サイト（メルカリ・ヤフオク）が在庫を持っていることが多いです。
      </p>
    </section>
  );
}
