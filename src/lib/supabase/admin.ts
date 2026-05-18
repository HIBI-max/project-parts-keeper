import { createClient } from "@supabase/supabase-js";
import type { Database } from "@/types/database";

/**
 * service_role キーで作成する管理用クライアント。
 * RLS をバイパスするのでサーバーサイド (API route や cron) からのみ使う。
 */
export function createAdminClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL!;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY!;
  if (!key) throw new Error("SUPABASE_SERVICE_ROLE_KEY is not configured");
  return createClient<Database>(url, key, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
}
