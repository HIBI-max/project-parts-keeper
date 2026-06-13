-- ============================================================
-- URL スラッグ追加
-- UUID ベース URL → SEO フレンドリー URL
-- /appliance/{uuid} → /appliance/{manufacturer-model_number}
-- /part/{uuid}      → /part/{mpn_slug}
-- ============================================================

-- メーカー名 → ASCII スラッグ変換関数
create or replace function public.manufacturer_to_slug(m text) returns text
language sql immutable strict parallel safe as $$
  select case m
    when 'シャープ'         then 'sharp'
    when 'ダイキン'         then 'daikin'
    when '日立'             then 'hitachi'
    when 'バルミューダ'     then 'balmuda'
    when 'カドー'           then 'cado'
    when '東芝'             then 'toshiba'
    when '三菱電機'         then 'mitsubishi'
    when '象印'             then 'zojirushi'
    when 'タイガー魔法瓶'   then 'tiger'
    when 'ダイソン'         then 'dyson'
    when 'アイリスオーヤマ' then 'iris-ohyama'
    when 'パナソニック'     then 'panasonic'
    else lower(regexp_replace(m, '[^a-zA-Z0-9]+', '-', 'g'))
  end;
$$;

-- slug カラム追加
alter table appliances add column if not exists slug text;
alter table parts      add column if not exists slug text;

-- appliances スラッグ生成
update appliances
set slug = trim(both '-' from
  manufacturer_to_slug(manufacturer) || '-' ||
  lower(regexp_replace(model_number, '[^a-zA-Z0-9]+', '-', 'g'))
);

-- parts スラッグ生成（品番あり: 品番ベース / 品番なし: UUID フォールバック）
update parts
set slug = trim(both '-' from
  case
    when manufacturer_part_number is not null
      then lower(regexp_replace(manufacturer_part_number, '[^a-zA-Z0-9]+', '-', 'g'))
    else id::text
  end
);

-- 重複スラッグに連番を付与（万が一の場合のみ発動）
with dups as (
  select id, slug, row_number() over (partition by slug order by created_at) as rn
  from appliances
  where slug in (select slug from appliances group by slug having count(*) > 1)
)
update appliances a
set slug = d.slug || '-' || d.rn
from dups d
where a.id = d.id and d.rn > 1;

with dups as (
  select id, slug, row_number() over (partition by slug order by created_at) as rn
  from parts
  where slug in (select slug from parts group by slug having count(*) > 1)
)
update parts p
set slug = d.slug || '-' || d.rn
from dups d
where p.id = d.id and d.rn > 1;

-- NOT NULL + UNIQUE インデックス
alter table appliances alter column slug set not null;
alter table parts      alter column slug set not null;
create unique index if not exists appliances_slug_idx on appliances (slug);
create unique index if not exists parts_slug_idx      on parts      (slug);
