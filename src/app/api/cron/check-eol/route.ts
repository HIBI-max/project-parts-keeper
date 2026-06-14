import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";

/**
 * 部品保有期間切れ通知 cron
 *
 * 動作:
 *   1. すべての favorites を走査
 *   2. 紐付く appliance.parts_retention_until が以下の場合に通知を生成:
 *      - 今年 + 1 以下 = eol_warning (残り 1 年以内)
 *      - 今年以下     = eol_expired
 *   3. 重複通知は (user_id, appliance_id, kind) で防止
 *
 * セキュリティ: Vercel Cron からの呼び出し時は `Authorization: Bearer <CRON_SECRET>`
 *
 * 拡張: Resend / SendGrid 等の API キーがあれば実メール送信を追加可能
 */
export async function GET(request: Request) {
  // Vercel Cron からのリクエストか検証
  const auth = request.headers.get("authorization");
  const expected = `Bearer ${process.env.CRON_SECRET}`;
  if (process.env.CRON_SECRET && auth !== expected) {
    return NextResponse.json({ error: "unauthorized" }, { status: 401 });
  }

  let admin;
  try {
    admin = createAdminClient();
  } catch (e) {
    return NextResponse.json(
      { error: "service_role not configured", detail: e instanceof Error ? e.message : String(e) },
      { status: 500 },
    );
  }

  const currentYear = new Date().getFullYear();

  interface FavRow {
    user_id: string;
    appliance_id: string;
    appliances: {
      slug: string;
      model_number: string;
      manufacturer: string;
      parts_retention_until: number | null;
    } | null;
  }

  const { data: favs, error: favErr } = await admin
    .from("favorites")
    .select(
      "user_id, appliance_id, appliances (slug, model_number, manufacturer, parts_retention_until)",
    );
  if (favErr) {
    return NextResponse.json({ error: favErr.message }, { status: 500 });
  }

  const inserts: {
    user_id: string;
    appliance_id: string;
    kind: "eol_warning" | "eol_expired";
    title: string;
    body: string;
    url: string;
  }[] = [];

  for (const f of (favs ?? []) as unknown as FavRow[]) {
    if (!f.appliances) continue;
    const until = f.appliances.parts_retention_until;
    if (until == null) continue;

    let kind: "eol_warning" | "eol_expired" | null = null;
    if (until < currentYear) kind = "eol_expired";
    else if (until <= currentYear + 1) kind = "eol_warning";
    if (!kind) continue;

    // 重複防止
    const { data: existing } = await admin
      .from("notifications")
      .select("id")
      .eq("user_id", f.user_id)
      .eq("appliance_id", f.appliance_id)
      .eq("kind", kind)
      .limit(1)
      .maybeSingle();
    if (existing) continue;

    const label = `${f.appliances.manufacturer} ${f.appliances.model_number}`;
    const title =
      kind === "eol_expired"
        ? `${label} の部品保有期間が終了しました`
        : `${label} の部品保有期間がもうすぐ終了 (${until} 年まで)`;
    const body =
      kind === "eol_expired"
        ? "メーカーの部品保有期間は終了しました。互換品・中古部品・代替品の検討を推奨します。"
        : "部品保有期間の終了が近づいています。必要な交換部品があれば早めの確保を推奨します。";

    inserts.push({
      user_id: f.user_id,
      appliance_id: f.appliance_id,
      kind,
      title,
      body,
      url: `/appliance/${f.appliances.slug}`,
    });
  }

  if (inserts.length > 0) {
    const { error: insErr } = await admin.from("notifications").insert(inserts);
    if (insErr) {
      return NextResponse.json({ error: insErr.message }, { status: 500 });
    }
  }

  return NextResponse.json({
    ok: true,
    scanned: (favs ?? []).length,
    created: inserts.length,
  });
}
