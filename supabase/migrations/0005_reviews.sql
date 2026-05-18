-- ============================================================
-- reviews: ユーザー投稿の修理体験談・部品評価
-- - 部品単位 or 機種単位どちらにも紐づけ可能
-- - rating は任意（1-5）、本文は必須
-- ============================================================

create type review_target as enum ('part', 'appliance');

create table reviews (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  target review_target not null,
  part_id uuid references parts(id) on delete cascade,
  appliance_id uuid references appliances(id) on delete cascade,
  rating int check (rating between 1 and 5),
  body text not null check (char_length(body) between 1 and 2000),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  -- 排他: どちらか片方
  constraint reviews_target_check check (
    (target = 'part' and part_id is not null and appliance_id is null) or
    (target = 'appliance' and appliance_id is not null and part_id is null)
  )
);
create index reviews_part_idx on reviews (part_id, created_at desc) where part_id is not null;
create index reviews_appliance_idx on reviews (appliance_id, created_at desc) where appliance_id is not null;
create index reviews_user_idx on reviews (user_id, created_at desc);

alter table reviews enable row level security;
-- 公開: 全員 select 可
create policy "reviews readable by all" on reviews for select using (true);
-- 投稿: 自分の user_id のみ
create policy "reviews own insert" on reviews for insert
  with check (auth.uid() = user_id);
-- 編集・削除: 投稿者本人のみ
create policy "reviews own update" on reviews for update
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "reviews own delete" on reviews for delete
  using (auth.uid() = user_id);
