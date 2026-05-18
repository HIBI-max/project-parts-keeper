"use client";

import { useState } from "react";

interface Props {
  url: string;
  text: string;
}

export function ShareButtons({ url, text }: Props) {
  const [copied, setCopied] = useState(false);

  async function copy() {
    try {
      await navigator.clipboard.writeText(url);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch {
      // ignore (insecure context など)
    }
  }

  const encoded = encodeURIComponent(text);
  const encodedUrl = encodeURIComponent(url);

  return (
    <section className="mt-8">
      <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-3">
        この情報を共有
      </h2>
      <div className="flex flex-wrap gap-2">
        <a
          href={`https://twitter.com/intent/tweet?text=${encoded}&url=${encodedUrl}`}
          target="_blank"
          rel="noopener noreferrer"
          className="flex items-center gap-1.5 px-3 py-2 rounded-lg bg-black text-white text-sm hover:opacity-90"
        >
          <span>𝕏</span>
          <span>でポスト</span>
        </a>
        <a
          href={`https://social-plugins.line.me/lineit/share?url=${encodedUrl}`}
          target="_blank"
          rel="noopener noreferrer"
          className="flex items-center gap-1.5 px-3 py-2 rounded-lg bg-[#06C755] text-white text-sm hover:opacity-90"
        >
          <span>LINE</span>
          <span>で送る</span>
        </a>
        <button
          type="button"
          onClick={copy}
          className="flex items-center gap-1.5 px-3 py-2 rounded-lg border border-[var(--card-border)] bg-[var(--card)] text-sm hover:border-[var(--accent)]"
        >
          {copied ? "✓ コピーしました" : "🔗 URL をコピー"}
        </button>
      </div>
    </section>
  );
}
