"use client";

import { useRouter } from "next/navigation";
import { useEffect, useRef, useState } from "react";
import { APPLIANCE_CATEGORY_LABEL } from "@/lib/format";
import { createClient } from "@/lib/supabase/client";

interface Suggestion {
  id: string;
  manufacturer: string;
  model_number: string;
  model_name: string | null;
  category: string;
}

interface Props {
  initialValue?: string;
  /** 「検索」ボタンを表示する (home 用) / false なら入力後即 navigate (search ページ用) */
  showButton?: boolean;
  placeholder?: string;
}

export function SearchInput({ initialValue = "", showButton = true, placeholder }: Props) {
  const router = useRouter();
  const [query, setQuery] = useState(initialValue);
  const [suggestions, setSuggestions] = useState<Suggestion[]>([]);
  const [open, setOpen] = useState(false);
  const [highlight, setHighlight] = useState(-1);
  const inputRef = useRef<HTMLInputElement>(null);
  const wrapRef = useRef<HTMLDivElement>(null);

  // debounce 200ms
  useEffect(() => {
    const q = query.trim();
    if (q.length < 2) {
      setSuggestions([]);
      setOpen(false);
      return;
    }
    const handle = setTimeout(async () => {
      const supabase = createClient();
      const { data } = await supabase
        .from("appliances")
        .select("id, manufacturer, model_number, model_name, category")
        .or(`model_number.ilike.${q}%,model_name.ilike.%${q}%`)
        .order("manufacturer")
        .limit(8);
      setSuggestions((data ?? []) as Suggestion[]);
      setOpen(true);
      setHighlight(-1);
    }, 200);
    return () => clearTimeout(handle);
  }, [query]);

  // 外クリックで閉じる
  useEffect(() => {
    function onClick(e: MouseEvent) {
      if (wrapRef.current && !wrapRef.current.contains(e.target as Node)) {
        setOpen(false);
      }
    }
    document.addEventListener("mousedown", onClick);
    return () => document.removeEventListener("mousedown", onClick);
  }, []);

  function submit(target?: string) {
    const q = (target ?? query).trim();
    if (!q) return;
    if (target) {
      // suggestion クリック時は appliance 詳細へ直行
      const picked = suggestions.find((s) => s.model_number === target);
      if (picked) {
        router.push(`/appliance/${picked.id}`);
        return;
      }
    }
    router.push(`/search?q=${encodeURIComponent(q)}`);
  }

  function onKey(e: React.KeyboardEvent<HTMLInputElement>) {
    if (!open || suggestions.length === 0) return;
    if (e.key === "ArrowDown") {
      e.preventDefault();
      setHighlight((h) => Math.min(h + 1, suggestions.length - 1));
    } else if (e.key === "ArrowUp") {
      e.preventDefault();
      setHighlight((h) => Math.max(h - 1, -1));
    } else if (e.key === "Enter") {
      if (highlight >= 0) {
        e.preventDefault();
        const picked = suggestions[highlight];
        router.push(`/appliance/${picked.id}`);
      }
    } else if (e.key === "Escape") {
      setOpen(false);
    }
  }

  return (
    <div ref={wrapRef} className="relative">
      <form
        onSubmit={(e) => {
          e.preventDefault();
          submit();
        }}
        className="flex gap-2"
      >
        <input
          ref={inputRef}
          name="q"
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          onFocus={() => suggestions.length > 0 && setOpen(true)}
          onKeyDown={onKey}
          placeholder={placeholder ?? "例: SR-MPA101 / NW-JZ10"}
          autoComplete="off"
          className="flex-1 px-3 py-2.5 rounded-lg border border-[var(--card-border)] bg-white focus:outline-none focus:ring-2 focus:ring-[var(--accent)]"
        />
        {showButton && (
          <button
            type="submit"
            className="px-5 py-2.5 rounded-lg bg-[var(--accent)] text-white font-medium hover:bg-[var(--accent-deep)]"
          >
            検索
          </button>
        )}
      </form>

      {open && suggestions.length > 0 && (
        <ul className="absolute z-10 left-0 right-0 mt-1 bg-white border border-[var(--card-border)] rounded-lg shadow-lg overflow-hidden">
          {suggestions.map((s, i) => (
            <li key={s.id}>
              <button
                type="button"
                onClick={() => {
                  setOpen(false);
                  router.push(`/appliance/${s.id}`);
                }}
                onMouseEnter={() => setHighlight(i)}
                className={`w-full text-left px-3 py-2 flex items-baseline gap-2 ${
                  i === highlight ? "bg-[var(--accent)]/10" : "hover:bg-[var(--accent)]/5"
                }`}
              >
                <span className="font-semibold text-sm truncate">{s.model_number}</span>
                <span className="text-xs text-[var(--muted)] truncate">
                  {s.manufacturer} · {APPLIANCE_CATEGORY_LABEL[s.category] ?? s.category}
                </span>
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
