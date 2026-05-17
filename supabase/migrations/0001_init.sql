-- ============================================================
-- Parts Keeper 初期スキーマ
-- 家電マスタ × 部品マスタ × EC在庫キャッシュ × ユーザーお気に入り
-- ============================================================

create extension if not exists pg_trgm with schema extensions;

-- ============================================================
-- ENUMs
-- ============================================================
create type appliance_category as enum (
  'rice_cooker',       -- 炊飯器
  'washing_machine',   -- 洗濯機
  'vacuum',            -- 掃除機
  'air_conditioner',   -- エアコン（V2）
  'microwave',         -- 電子レンジ（V2）
  'other'
);

create type part_category as enum (
  'inner_pot',         -- 内釜
  'filter',            -- フィルター
  'remote',            -- リモコン
  'battery',           -- バッテリー
  'bag',               -- 集塵パック
  'brush',             -- ブラシ
  'belt',              -- ベルト
  'gasket',            -- パッキン
  'other'
);

create type part_kind as enum ('oem', 'compatible');
-- oem = メーカー純正、compatible = 互換品

create type listing_source as enum ('rakuten', 'amazon', 'yahoo', 'manufacturer');

-- ============================================================
-- appliances（家電本体マスタ）
-- ============================================================
create table appliances (
  id uuid primary key default gen_random_uuid(),
  manufacturer text not null,
  category appliance_category not null,
  model_number text not null,
  model_name text,
  release_year int,
  production_end_year int,
  parts_retention_until int, -- 部品保有期間の終了年（メーカー公約）
  image_url text,
  notes text,
  created_at timestamptz not null default now(),
  unique (manufacturer, model_number)
);
create index appliances_model_trgm_idx
  on appliances using gin (model_number extensions.gin_trgm_ops);
create index appliances_category_idx on appliances (category);

-- ============================================================
-- parts（部品マスタ）
-- ============================================================
create table parts (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category part_category not null,
  kind part_kind not null default 'oem',
  manufacturer text,
  manufacturer_part_number text, -- メーカー品番（例: ARC-XJ8）
  image_url text,
  description text,
  created_at timestamptz not null default now()
);
create index parts_category_idx on parts (category);
create index parts_mpn_idx
  on parts (manufacturer_part_number)
  where manufacturer_part_number is not null;

-- ============================================================
-- appliance_parts（家電⇔部品の多対多）
-- ============================================================
create table appliance_parts (
  appliance_id uuid not null references appliances(id) on delete cascade,
  part_id uuid not null references parts(id) on delete cascade,
  fitment_note text, -- 「2018年以降モデル限定」等の注記
  created_at timestamptz not null default now(),
  primary key (appliance_id, part_id)
);
create index appliance_parts_part_idx on appliance_parts (part_id);

-- ============================================================
-- listings（EC 在庫キャッシュ。リアル検索は API 直接、ここはバッチで貯める）
-- ============================================================
create table listings (
  id uuid primary key default gen_random_uuid(),
  part_id uuid not null references parts(id) on delete cascade,
  source listing_source not null,
  title text not null,
  url text not null,
  affiliate_url text,
  price_jpy int,
  in_stock boolean,
  shop_name text,
  fetched_at timestamptz not null default now()
);
create index listings_part_source_idx on listings (part_id, source);
create index listings_fetched_idx on listings (fetched_at);

-- ============================================================
-- favorites（マイ家電 = ユーザー登録）
-- P2 で UI 実装。テーブルは先に切っておく。
-- ============================================================
create table favorites (
  user_id uuid not null references auth.users(id) on delete cascade,
  appliance_id uuid not null references appliances(id) on delete cascade,
  nickname text,
  purchased_at date,
  created_at timestamptz not null default now(),
  primary key (user_id, appliance_id)
);

-- ============================================================
-- RLS
-- ============================================================
alter table appliances enable row level security;
alter table parts enable row level security;
alter table appliance_parts enable row level security;
alter table listings enable row level security;
alter table favorites enable row level security;

-- マスタ系は全公開
create policy "appliances readable by all" on appliances for select using (true);
create policy "parts readable by all" on parts for select using (true);
create policy "appliance_parts readable by all" on appliance_parts for select using (true);
create policy "listings readable by all" on listings for select using (true);

-- favorites は本人のみ
create policy "favorites own select" on favorites for select using (auth.uid() = user_id);
create policy "favorites own insert" on favorites for insert with check (auth.uid() = user_id);
create policy "favorites own update" on favorites for update using (auth.uid() = user_id);
create policy "favorites own delete" on favorites for delete using (auth.uid() = user_id);
