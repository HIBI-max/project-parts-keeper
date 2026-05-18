-- ============================================================
-- 通知テーブル (V2 部品保有期間切れ通知の前段)
-- ユーザーごとに「この家電の部品保有期間がもうすぐ終わる」等を蓄積
-- ============================================================

create type notification_kind as enum (
  'eol_warning',       -- 部品保有期間まで残り 1-2 年
  'eol_expired',       -- 部品保有期間終了
  'price_drop'         -- (V2 価格変動通知用、未実装)
);

create table notifications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  appliance_id uuid references appliances(id) on delete cascade,
  kind notification_kind not null,
  title text not null,
  body text,
  url text,             -- 詳細ページへのリンク
  read_at timestamptz,  -- 既読タイムスタンプ (null = 未読)
  created_at timestamptz not null default now()
);
create index notifications_user_unread_idx
  on notifications (user_id, created_at desc)
  where read_at is null;

alter table notifications enable row level security;
create policy "notifications own select" on notifications
  for select using (auth.uid() = user_id);
create policy "notifications own update" on notifications
  for update using (auth.uid() = user_id);

-- service role 経由（cron）からの insert を許可するため、insert policy は無し
-- (anon/authed からの insert はブロック、service_role はバイパス)
