-- ============================================================
-- appliances.is_verified: 部品が楽天で実在確認できたモデルかどうか
-- false = auto-discovered のみで、楽天には部品単体販売がない可能性が高い
-- ============================================================

alter table appliances add column is_verified boolean not null default false;
create index appliances_verified_idx on appliances (is_verified, manufacturer);

-- backfill: 関連 parts のいずれかが image_url または manufacturer_part_number を持つなら verified
update appliances set is_verified = true
where id in (
  select distinct ap.appliance_id
  from appliance_parts ap
  join parts p on p.id = ap.part_id
  where p.image_url is not null or p.manufacturer_part_number is not null
);
