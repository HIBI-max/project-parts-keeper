"use client";

import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import { createClient } from "@/lib/supabase/client";

interface Props {
  applianceId: string;
}

export function FavoriteButton({ applianceId }: Props) {
  const router = useRouter();
  const [state, setState] = useState<"loading" | "in" | "out" | "anonymous">("loading");
  const [working, setWorking] = useState(false);

  useEffect(() => {
    const supabase = createClient();
    (async () => {
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (!user) {
        setState("anonymous");
        return;
      }
      const { data } = await supabase
        .from("favorites")
        .select("appliance_id")
        .eq("appliance_id", applianceId)
        .maybeSingle();
      setState(data ? "in" : "out");
    })();
  }, [applianceId]);

  async function toggle() {
    if (state === "anonymous") {
      router.push("/login");
      return;
    }
    setWorking(true);
    const supabase = createClient();
    const {
      data: { user },
    } = await supabase.auth.getUser();
    if (!user) {
      router.push("/login");
      return;
    }
    if (state === "in") {
      await supabase
        .from("favorites")
        .delete()
        .eq("appliance_id", applianceId)
        .eq("user_id", user.id);
      setState("out");
    } else {
      await supabase.from("favorites").insert({ appliance_id: applianceId, user_id: user.id });
      setState("in");
    }
    setWorking(false);
    router.refresh();
  }

  if (state === "loading") {
    return (
      <button
        type="button"
        disabled
        className="text-xs px-3 py-1.5 rounded border border-[var(--card-border)] text-[var(--muted)]"
      >
        …
      </button>
    );
  }

  const inFav = state === "in";
  return (
    <button
      type="button"
      onClick={toggle}
      disabled={working}
      className={
        inFav
          ? "text-xs px-3 py-1.5 rounded bg-[var(--accent)] text-white hover:bg-[var(--accent-deep)] disabled:opacity-50"
          : "text-xs px-3 py-1.5 rounded border border-[var(--accent)] text-[var(--accent-deep)] hover:bg-[var(--accent)]/10 disabled:opacity-50"
      }
    >
      {inFav ? "★ マイ家電に登録済" : "☆ マイ家電に追加"}
    </button>
  );
}
