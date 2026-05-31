-- ============================================================
-- 空気清浄機フィルターの parts + appliance_parts リンク
-- discover-air-purifier-parts.ts（楽天フィルター商品タイトルから品番抽出）由来。
-- 各フィルター = parts 1 行（kind=oem、メーカー純正品番）。CTE で挿入し、
-- 互換モデル群に appliance_parts でリンク。画像は part 詳細の楽天ライブ検索で表示。
-- ============================================================

-- ===== シャープ =====
-- 集じんフィルター（50クラス）
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター FZ-D50HF', 'filter', 'oem', 'シャープ', 'FZ-D50HF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier'
  and a.model_number in ('KC-D50','KC-E50','KC-F50','KC-G50','KC-H50','KC-J50','KC-L50','KC-N50','KC-P50','KC-R50','KI-GS50','KI-HS50','KI-JS50','KI-LS50')
on conflict do nothing;

-- 脱臭フィルター（50クラス）
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('脱臭フィルター FZ-D50DF', 'filter', 'oem', 'シャープ', 'FZ-D50DF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier'
  and a.model_number in ('KC-D50','KC-E50','KC-F50','KC-G50','KC-H50','KC-J50','KC-L50','KC-N50','KC-P50','KC-R50','KI-GS50','KI-HS50','KI-JS50','KI-LS50')
on conflict do nothing;

-- 加湿フィルター（KC 共通）
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('加湿フィルター FZ-Y80MF', 'filter', 'oem', 'シャープ', 'FZ-Y80MF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier'
  and a.model_number in ('KC-B40','KC-D40','KC-E40','KC-F40','KC-G40','KC-D50','KC-E50','KC-F50','KC-G50','KC-H50','KC-J50','KC-L50','KC-N50','KC-P50','KC-R50','KC-D70','KC-E70','KC-F70')
on conflict do nothing;

-- 加湿フィルター（KI 共通）
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('加湿フィルター FZ-G70MF', 'filter', 'oem', 'シャープ', 'FZ-G70MF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier'
  and a.model_number in ('KI-GS50','KI-HS50','KI-JS50','KI-LS50','KI-GS70','KI-HS70','KI-JS70')
on conflict do nothing;

-- 集じんフィルター（70クラス）
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター FZ-D70HF', 'filter', 'oem', 'シャープ', 'FZ-D70HF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier'
  and a.model_number in ('KC-D70','KC-E70','KC-F70','KI-GS70','KI-HS70','KI-JS70')
on conflict do nothing;

-- 脱臭フィルター（70クラス）
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('脱臭フィルター FZ-D70DF', 'filter', 'oem', 'シャープ', 'FZ-D70DF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier'
  and a.model_number in ('KC-D70','KC-E70','KC-F70','KI-GS70','KI-HS70','KI-JS70')
on conflict do nothing;

-- 集じん・脱臭一体フィルター（40クラス）
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じん・脱臭一体型フィルター FZ-D40SF', 'filter', 'oem', 'シャープ', 'FZ-D40SF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier'
  and a.model_number in ('KC-D40','KC-E40','KC-F40')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じん・脱臭一体型フィルター FZ-G40SF', 'filter', 'oem', 'シャープ', 'FZ-G40SF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KC-G40')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じん・脱臭一体型フィルター FZ-A40SF', 'filter', 'oem', 'シャープ', 'FZ-A40SF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KC-B40')
on conflict do nothing;

-- 旧50クラス
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター FZ-A50HF', 'filter', 'oem', 'シャープ', 'FZ-A50HF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KC-A50')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター FZ-BX50HF', 'filter', 'oem', 'シャープ', 'FZ-BX50HF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KC-B50','KI-BX50','KI-DX50')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('脱臭フィルター FZ-B50DF', 'filter', 'oem', 'シャープ', 'FZ-B50DF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KC-B50')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('脱臭フィルター FZ-BX50DF', 'filter', 'oem', 'シャープ', 'FZ-BX50DF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KI-BX50','KI-DX50')
on conflict do nothing;

-- 旧70クラス
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター FZ-AX70HF', 'filter', 'oem', 'シャープ', 'FZ-AX70HF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KC-A70')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター FZ-BX70HF', 'filter', 'oem', 'シャープ', 'FZ-BX70HF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KC-B70')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('脱臭フィルター FZ-B70DF', 'filter', 'oem', 'シャープ', 'FZ-B70DF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KC-B70')
on conflict do nothing;

-- 75クラス（KI-EX75 / KI-FX75）
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター FZ-E75HF', 'filter', 'oem', 'シャープ', 'FZ-E75HF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KI-EX75','KI-FX75')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('脱臭フィルター FZ-E75DF', 'filter', 'oem', 'シャープ', 'FZ-E75DF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KI-EX75','KI-FX75')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('加湿フィルター FZ-AX80MF', 'filter', 'oem', 'シャープ', 'FZ-AX80MF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier' and a.model_number in ('KI-EX75','KI-FX75')
on conflict do nothing;

-- Ag+イオンカートリッジ（モダン KC/KI 共通消耗品）
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('Ag+イオンカートリッジ FZ-AG01K1', 'other', 'oem', 'シャープ', 'FZ-AG01K1') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'シャープ' and a.category = 'air_purifier'
  and a.model_number in ('KC-D40','KC-E40','KC-F40','KC-G40','KC-D50','KC-E50','KC-F50','KC-G50','KC-H50','KC-J50','KC-L50','KC-N50','KC-P50','KC-R50','KC-D70','KC-E70','KC-F70','KI-GS50','KI-HS50','KI-JS50','KI-LS50','KI-GS70','KI-HS70','KI-JS70')
on conflict do nothing;

-- ===== ダイキン =====
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター（静電HEPA）KAFP029A4', 'filter', 'oem', 'ダイキン', 'KAFP029A4') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'ダイキン' and a.category = 'air_purifier'
  and a.model_number in ('MCK70M','MCK70N','MCK70P','MCK70R','ACK70M','ACK70N','ACK70P','ACK70R','TCK70P','TCK70R')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター（静電HEPA）KAFP085A4', 'filter', 'oem', 'ダイキン', 'KAFP085A4') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'ダイキン' and a.category = 'air_purifier'
  and a.model_number in ('MCK70U','MCK70V','MCK70W','ACK70U','ACK70V','ACK70W')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター（静電HEPA）KAFP044A4', 'filter', 'oem', 'ダイキン', 'KAFP044A4') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'ダイキン' and a.category = 'air_purifier'
  and a.model_number in ('MCK55N','MCK55P','MCK55R','TCK55P','TCK55R')
on conflict do nothing;

-- ===== 日立 =====
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター EPF-MVG90H', 'filter', 'oem', '日立', 'EPF-MVG90H') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = '日立' and a.category = 'air_purifier'
  and a.model_number in ('EP-NVG70','EP-NVG90','EP-MVG70','EP-MVG90')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター EPF-MVG110H', 'filter', 'oem', '日立', 'EPF-MVG110H') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = '日立' and a.category = 'air_purifier'
  and a.model_number in ('EP-NVG110','EP-MVG110')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター EPF-LVG110H', 'filter', 'oem', '日立', 'EPF-LVG110H') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = '日立' and a.category = 'air_purifier' and a.model_number in ('EP-LVG110')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('加湿フィルター EPF-KVG900KF', 'filter', 'oem', '日立', 'EPF-KVG900KF') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = '日立' and a.category = 'air_purifier'
  and a.model_number in ('EP-NVG70','EP-NVG90','EP-NVG110','EP-MVG70','EP-MVG90','EP-MVG110','EP-LVG110')
on conflict do nothing;

-- ===== バルミューダ =====
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('360°酵素フィルター EJT-S200', 'filter', 'oem', 'バルミューダ', 'EJT-S200') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'バルミューダ' and a.category = 'air_purifier' and a.model_number in ('EJT-1000','EJT-1100SD')
on conflict do nothing;

-- ===== カドー =====
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('交換用フィルター FL-C320', 'filter', 'oem', 'カドー', 'FL-C320') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'カドー' and a.category = 'air_purifier' and a.model_number in ('AP-C320','AP-C200')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('交換用フィルター FL-C130', 'filter', 'oem', 'カドー', 'FL-C130') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'カドー' and a.category = 'air_purifier' and a.model_number in ('AP-C120','AP-C110','AP-C100')
on conflict do nothing;

-- ===== Panasonic =====
-- 70/90クラス
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター F-ZXLP90', 'filter', 'oem', 'Panasonic', 'F-ZXLP90') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'Panasonic' and a.category = 'air_purifier'
  and a.model_number in ('F-VC70XS','F-VC70XR','F-VC70XP','F-VC70XM','F-VC70XL','F-VXS70','F-VXR70','F-VXP70','F-VXM70','F-VXL70','F-VXS90','F-VXR90','F-VXP90','F-VXM90','F-VXL90')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('脱臭フィルター F-ZXLD90', 'filter', 'oem', 'Panasonic', 'F-ZXLD90') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'Panasonic' and a.category = 'air_purifier'
  and a.model_number in ('F-VC70XS','F-VC70XR','F-VC70XP','F-VC70XM','F-VC70XL','F-VXS70','F-VXR70','F-VXP70','F-VXM70','F-VXL70','F-VXS90','F-VXR90','F-VXP90','F-VXM90','F-VXL90')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('加湿フィルター F-ZXJV90', 'filter', 'oem', 'Panasonic', 'F-ZXJV90') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'Panasonic' and a.category = 'air_purifier'
  and a.model_number in ('F-VC70XS','F-VC70XR','F-VC70XP','F-VC70XM','F-VC70XL','F-VXS70','F-VXR70','F-VXP70','F-VXM70','F-VXL70','F-VXS90','F-VXR90','F-VXP90','F-VXM90','F-VXL90')
on conflict do nothing;

-- 50/55クラス
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター F-ZXJP50', 'filter', 'oem', 'Panasonic', 'F-ZXJP50') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'Panasonic' and a.category = 'air_purifier' and a.model_number in ('F-VXS55','F-VXR55','F-VC55XS')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター F-ZXGP50', 'filter', 'oem', 'Panasonic', 'F-ZXGP50') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'Panasonic' and a.category = 'air_purifier' and a.model_number in ('F-VXH50','F-VXG50')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('脱臭フィルター F-ZXFD45', 'filter', 'oem', 'Panasonic', 'F-ZXFD45') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'Panasonic' and a.category = 'air_purifier' and a.model_number in ('F-VXS55','F-VXR55','F-VC55XS','F-VXH50','F-VXG50')
on conflict do nothing;

-- 65クラス
with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('集じんフィルター F-ZXFP70', 'filter', 'oem', 'Panasonic', 'F-ZXFP70') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'Panasonic' and a.category = 'air_purifier' and a.model_number in ('F-VXF65')
on conflict do nothing;

with p as (
  insert into parts (name, category, kind, manufacturer, manufacturer_part_number)
  values ('脱臭フィルター F-ZXFD70', 'filter', 'oem', 'Panasonic', 'F-ZXFD70') returning id
)
insert into appliance_parts (appliance_id, part_id)
select a.id, p.id from appliances a cross join p
where a.manufacturer = 'Panasonic' and a.category = 'air_purifier' and a.model_number in ('F-VXF65')
on conflict do nothing;
