"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import { createClient } from "@/lib/supabase/client";

interface Props {
  applianceId: string;
  initialNickname: string | null;
  initialPurchasedAt: string | null;
}

export function FavoriteMetaForm({ applianceId, initialNickname, initialPurchasedAt }: Props) {
  const router = useRouter();
  const [open, setOpen] = useState(false);
  const [nickname, setNickname] = useState(initialNickname ?? "");
  const [purchasedAt, setPurchasedAt] = useState(initialPurchasedAt ?? "");
  const [saving, setSaving] = useState(false);

  async function save() {
    setSaving(true);
    const supabase = createClient();
    const {
      data: { user },
    } = await supabase.auth.getUser();
    if (!user) {
      setSaving(false);
      return;
    }
    await supabase
      .from("favorites")
      .update({
        nickname: nickname.trim() || null,
        purchased_at: purchasedAt || null,
      })
      .eq("user_id", user.id)
      .eq("appliance_id", applianceId);
    setSaving(false);
    setOpen(false);
    router.refresh();
  }

  if (!open) {
    return (
      <button
        type="button"
        onClick={() => setOpen(true)}
        className="text-xs text-[var(--accent-deep)] hover:underline"
      >
        ✏️ ニックネーム・購入日を編集
      </button>
    );
  }

  return (
    <div className="mt-3 space-y-2 p-3 rounded border border-[var(--card-border)] bg-white/50">
      <div>
        <label className="text-xs font-semibold text-[var(--muted)]">ニックネーム</label>
        <input
          type="text"
          value={nickname}
          onChange={(e) => setNickname(e.target.value)}
          placeholder="リビングの炊飯器"
          className="mt-1 w-full px-2 py-1.5 rounded border border-[var(--card-border)] bg-white text-sm focus:outline-none focus:ring-2 focus:ring-[var(--accent)]"
        />
      </div>
      <div>
        <label className="text-xs font-semibold text-[var(--muted)]">購入日</label>
        <input
          type="date"
          value={purchasedAt}
          onChange={(e) => setPurchasedAt(e.target.value)}
          className="mt-1 w-full px-2 py-1.5 rounded border border-[var(--card-border)] bg-white text-sm focus:outline-none focus:ring-2 focus:ring-[var(--accent)]"
        />
      </div>
      <div className="flex gap-2 pt-1">
        <button
          type="button"
          onClick={save}
          disabled={saving}
          className="px-3 py-1.5 rounded bg-[var(--accent)] text-white text-xs font-medium hover:bg-[var(--accent-deep)] disabled:opacity-50"
        >
          {saving ? "保存中…" : "保存"}
        </button>
        <button
          type="button"
          onClick={() => setOpen(false)}
          disabled={saving}
          className="px-3 py-1.5 rounded border border-[var(--card-border)] text-xs hover:bg-[var(--card)]"
        >
          キャンセル
        </button>
      </div>
    </div>
  );
}
