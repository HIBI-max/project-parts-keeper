-- ============================================================
-- Parts Keeper — P0 シード（楽天 API discovery で実在検証済み）
--
-- 方針:
-- - 機種・部品はすべて楽天市場に実際の販売実績があることを確認
-- - manufacturer_part_number は楽天の販売タイトルから抽出した値のみ
-- - 互換機種（兄弟モデル）も登録して appliance_parts で n:m 関係を表現
-- - 命名規則: 部品 name = "{部品カテゴリ和名} {代表型番}"
-- ============================================================

-- ============================================================
-- appliances
-- ============================================================
insert into appliances
  (manufacturer, category, model_number, model_name, release_year, production_end_year, parts_retention_until, notes)
values
  -- 炊飯器 / Panasonic（SR-MPA 系・SR-VSX 系・SR-FE 系それぞれ互換ファミリーで登録）
  ('Panasonic', 'rice_cooker', 'SR-MPA101', 'おどり炊き 5.5合 IH圧力', 2021, 2024, 2030, 'SR-MPA102 と内釜共通（ARE50-M78）。'),
  ('Panasonic', 'rice_cooker', 'SR-MPA102', 'おどり炊き 5.5合 IH圧力（同系後継）', 2022, 2024, 2030, 'SR-MPA101 と内釜共通。'),

  ('Panasonic', 'rice_cooker', 'SR-VSX101', 'Wおどり炊き 5.5合 可変圧力IH', 2020, 2023, 2029, '内釜 ARE50-M20。同系: SR-VSX100/108/109・SR-CVSX100。'),
  ('Panasonic', 'rice_cooker', 'SR-VSX100', 'Wおどり炊き 5.5合 可変圧力IH（前モデル）', 2019, 2022, 2028, 'SR-VSX101 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-VSX108', 'Wおどり炊き 5.5合 可変圧力IH（カラー違い）', 2020, 2023, 2029, 'SR-VSX101 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-VSX109', 'Wおどり炊き 5.5合 可変圧力IH（後継）', 2021, 2024, 2030, 'SR-VSX101 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-CVSX100', 'Wおどり炊き 5.5合 ハイエンド', 2019, 2022, 2028, 'SR-VSX101 と内釜共通。'),

  ('Panasonic', 'rice_cooker', 'SR-FE101', 'IH炊飯器 5.5合 シンプル', 2019, 2022, 2028, '内釜 ARE50-M26。同系: SR-FE109・SR-CFE109。'),
  ('Panasonic', 'rice_cooker', 'SR-FE109', 'IH炊飯器 5.5合 シンプル（後継）', 2020, 2023, 2029, 'SR-FE101 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-CFE109', 'IH炊飯器 5.5合 シンプル（カラー違い）', 2020, 2023, 2029, 'SR-FE101 と内釜共通。'),

  -- 炊飯器 / Zojirushi
  ('象印', 'rice_cooker', 'NP-RY05', '極め炊き 3合 圧力IH', 2020, 2023, 2029, '少人数向け。内釜 B527-6B（NP-RZ05 と共通）。'),
  ('象印', 'rice_cooker', 'NP-RZ05', '極め炊き 3合 圧力IH（同系）', 2019, 2022, 2028, 'NP-RY05 と内釜共通。'),
  ('象印', 'rice_cooker', 'NW-JZ10', '炎舞炊き 5.5合 圧力IH', 2022, null, null, '内釜 B654-6B。フラッグシップ、継続販売中。'),
  ('象印', 'rice_cooker', 'NW-LA10', '炎舞炊き 5.5合 圧力IH', 2018, 2021, 2027, '内釜 B575-6B。部品保有期間まで残り 1 年。'),

  -- 炊飯器 / Tiger（楽天では部品単体流通が少ない。公式の部品検索が必要）
  ('タイガー魔法瓶', 'rice_cooker', 'JPI-A100', 'ご泡火炊き 5.5合 圧力IH', 2020, 2023, 2029, '土鍋コーティング、内釜 5 年保証。'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPC-G100', 'タクック 5.5合 マイコン', 2018, 2021, 2027, null),

  -- 炊飯器 / その他
  ('東芝', 'rice_cooker', 'RC-10VXV', '真空圧力IH 5.5合', 2020, 2023, 2029, '備長炭コート内釜。'),
  ('三菱電機', 'rice_cooker', 'NJ-AWB10', '本炭釜 5.5合 IH', 2021, 2024, 2030, '内釜 M15X16340（NJ-AWBX10 と共通）。炭素素材、落下注意。'),
  ('三菱電機', 'rice_cooker', 'NJ-AWBX10', '本炭釜 5.5合 IH（上位）', 2021, 2024, 2030, 'NJ-AWB10 と内釜共通。'),

  -- 洗濯機
  ('Panasonic', 'washing_machine', 'NA-FA8H1', '全自動洗濯機 8kg', 2020, 2023, 2029, null),
  ('日立', 'washing_machine', 'BW-V100J', 'ビートウォッシュ 10kg', 2021, 2024, 2030, null),
  ('シャープ', 'washing_machine', 'ES-GV9F', '穴なし槽 9kg', 2020, 2023, 2029, null),

  -- 掃除機
  ('シャープ', 'vacuum', 'EC-PX700', 'コードレススティック', 2014, 2017, 2023, '部品保有期間既に終了。互換バッテリーのみ流通。'),
  ('ダイソン', 'vacuum', 'V12 Detect Slim', 'コードレススティック', 2021, null, null, '純正バッテリーは Dyson 公式オンラインで購入推奨。'),
  ('Panasonic', 'vacuum', 'MC-SB85J', 'パワーコードレス', 2020, 2023, 2029, null),

  -- エアコン
  ('Panasonic', 'air_conditioner', 'CS-X401D2', 'エオリア X 14畳', 2021, 2024, 2034, 'お掃除ロボ搭載、フィルター自動清掃。'),
  ('ダイキン', 'air_conditioner', 'AN40YEP-W', 'うるるとさらら R 14畳', 2021, 2024, 2034, null),
  ('日立', 'air_conditioner', 'RAS-D40K', '白くまくん 14畳', 2020, 2023, 2033, null),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW4022S', '霧ヶ峰 Zシリーズ 14畳', 2022, null, null, '継続販売中。'),

  -- 電子レンジ
  ('Panasonic', 'microwave', 'NE-BS807', 'ビストロ 30L スチームオーブン', 2020, 2023, 2029, null),
  ('日立', 'microwave', 'MRO-W10X', 'ヘルシーシェフ 30L', 2021, 2024, 2030, null),
  ('東芝', 'microwave', 'ER-RD3000', '石窯ドーム 30L', 2020, 2023, 2029, null),
  ('シャープ', 'microwave', 'AX-XA20', 'ヘルシオ 30L ウォーターオーブン', 2021, 2024, 2030, null),

  -- 冷蔵庫
  ('Panasonic', 'refrigerator', 'NR-F507WPX', 'はやうま冷凍 500L', 2021, 2024, 2030, null),
  ('日立', 'refrigerator', 'R-HW54R', 'まんなか野菜 540L', 2022, null, null, '継続販売中。'),
  ('三菱電機', 'refrigerator', 'MR-WX60G', '置けるスマート大容量 600L', 2021, 2024, 2030, null),
  ('東芝', 'refrigerator', 'GR-T550FZ', 'ベジータ 551L', 2021, 2024, 2030, null);

-- ============================================================
-- parts（共通部品は 1 件として登録、appliance_parts で複数機種に紐付ける）
-- ============================================================
insert into parts
  (name, category, kind, manufacturer, manufacturer_part_number, description)
values
  -- Panasonic SR-MPA101 系
  ('内釜 SR-MPA101', 'inner_pot', 'oem', 'Panasonic', 'ARE50-M78', 'ダイヤモンド竈釜。SR-MPA101/102 共通。'),
  ('蒸気ふた SR-MPA101', 'gasket', 'oem', 'Panasonic', null, '蒸気漏れの主要原因。要メーカー公式検索。'),

  -- Panasonic SR-VSX101 系（5 機種共通）
  ('内釜 SR-VSX101', 'inner_pot', 'oem', 'Panasonic', 'ARE50-M20', 'ダイヤモンド竈釜（プレミアム）。SR-VSX100/101/108/109・SR-CVSX100 共通。'),
  ('内釜 SR-VSX101（後継）', 'inner_pot', 'oem', 'Panasonic', 'ARE50-M201', 'ARE50-M20 の後継品。同系全機種互換。'),
  ('蒸気カバー SR-VSX101', 'gasket', 'oem', 'Panasonic', null, null),

  -- Panasonic SR-FE101 系（3 機種共通）
  ('内釜 SR-FE101', 'inner_pot', 'oem', 'Panasonic', 'ARE50-M26', 'SR-FE101/109・SR-CFE109 共通。'),

  -- 象印 NP-RY05 系
  ('内釜 NP-RY05', 'inner_pot', 'oem', '象印', 'B527-6B', '3 合用プラチナ厚釜。NP-RY05/RZ05 共通。'),
  ('内ぶた NP-RY05', 'gasket', 'oem', '象印', null, null),

  -- 象印 NW-JZ10
  ('内釜 NW-JZ10', 'inner_pot', 'oem', '象印', 'B654-6B', '豪炎かまど釜。'),
  ('内ぶた NW-JZ10', 'gasket', 'oem', '象印', null, null),

  -- 象印 NW-LA10
  ('内釜 NW-LA10', 'inner_pot', 'oem', '象印', 'B575-6B', '鉄器コート豪炎かまど釜。'),

  -- タイガー（部品番号未確認、name 検索にフォールバック）
  ('内釜 JPI-A100', 'inner_pot', 'oem', 'タイガー魔法瓶', null, '本土鍋（5 年保証）。'),
  ('内ぶた JPI-A100', 'gasket', 'oem', 'タイガー魔法瓶', null, null),
  ('内釜 JPC-G100', 'inner_pot', 'oem', 'タイガー魔法瓶', null, null),
  ('内ぶた JPC-G100', 'gasket', 'oem', 'タイガー魔法瓶', 'JPC1139', '負圧パッキン含む。JPC-A100/B100 系互換。'),

  -- 東芝
  ('内釜 RC-10VXV', 'inner_pot', 'oem', '東芝', null, '備長炭コート。'),
  ('内ぶた RC-10VXV', 'gasket', 'oem', '東芝', '320A2450', '5.5合炊き用内蓋。RC-100VXS / 10E8VS / 10E8VX 等互換。'),

  -- 三菱電機 NJ-AWB10 系
  ('内釜 NJ-AWB10', 'inner_pot', 'oem', '三菱電機', 'M15X16340', '本炭釜。NJ-AWB10/AWBX10 共通。炭素素材、落下注意。'),

  -- 洗濯機（楽天では部品単体流通が少ない）
  ('糸くずフィルター NA-FA8H1', 'filter', 'oem', 'Panasonic', null, '槽内のリント取り。'),
  ('給水ホース NA-FA8H1', 'other', 'oem', 'Panasonic', null, '長さ 1m。'),
  ('糸くずフィルター BW-V100J', 'filter', 'oem', '日立', null, null),
  ('糸くずフィルター ES-GV9F', 'filter', 'oem', 'シャープ', null, null),

  -- 掃除機
  ('バッテリー EC-PX700 互換', 'battery', 'compatible', 'サードパーティ', null, '純正品終売のため互換のみ流通。'),
  ('床用ブラシ EC-PX700', 'brush', 'oem', 'シャープ', null, null),
  ('バッテリー V12 Detect Slim', 'battery', 'oem', 'ダイソン', null, 'Dyson 公式オンラインを推奨。'),
  ('バッテリー MC-SB85J', 'battery', 'oem', 'Panasonic', null, null),

  -- エアコン（フィルター + リモコン中心）
  ('フィルター CS-X401D2', 'filter', 'oem', 'Panasonic', null, '空気清浄フィルター。'),
  ('リモコン CS-X401D2', 'remote', 'oem', 'Panasonic', null, null),
  ('フィルター AN40YEP-W', 'filter', 'oem', 'ダイキン', null, null),
  ('リモコン AN40YEP-W', 'remote', 'oem', 'ダイキン', null, null),
  ('フィルター RAS-D40K', 'filter', 'oem', '日立', null, null),
  ('リモコン RAS-D40K', 'remote', 'oem', '日立', null, null),
  ('フィルター MSZ-ZW4022S', 'filter', 'oem', '三菱電機', null, null),
  ('リモコン MSZ-ZW4022S', 'remote', 'oem', '三菱電機', null, null),

  -- 電子レンジ（ターンテーブル + 扉パッキン）
  ('ターンテーブル NE-BS807', 'turntable', 'oem', 'Panasonic', null, null),
  ('扉パッキン NE-BS807', 'gasket', 'oem', 'Panasonic', null, null),
  ('ターンテーブル MRO-W10X', 'turntable', 'oem', '日立', null, null),
  ('ターンテーブル ER-RD3000', 'turntable', 'oem', '東芝', null, null),
  ('ターンテーブル AX-XA20', 'turntable', 'oem', 'シャープ', null, null),

  -- 冷蔵庫（製氷皿 + 野菜ケース + ドアパッキン）
  ('製氷皿 NR-F507WPX', 'ice_tray', 'oem', 'Panasonic', null, '自動製氷ユニット。'),
  ('野菜ケース NR-F507WPX', 'other', 'oem', 'Panasonic', null, null),
  ('ドアパッキン NR-F507WPX', 'gasket', 'oem', 'Panasonic', null, '冷気漏れの主原因。'),
  ('製氷皿 R-HW54R', 'ice_tray', 'oem', '日立', null, null),
  ('製氷皿 MR-WX60G', 'ice_tray', 'oem', '三菱電機', null, null),
  ('製氷皿 GR-T550FZ', 'ice_tray', 'oem', '東芝', null, null),
  ('野菜ケース GR-T550FZ', 'other', 'oem', '東芝', '44082555', '純正部品。'),
  ('上冷凍室ドアパッキン GR-T550FZ', 'gasket', 'oem', '東芝', '44066330', '純正。GR-T600FZ 互換。'),
  ('下冷凍室ドアパッキン GR-T550FZ', 'gasket', 'oem', '東芝', '44066331', '純正。GR-T600FZ 互換。');

-- ============================================================
-- appliance_parts
--   共通部品は明示的に n:m リレーションを張る
-- ============================================================

-- 1) SR-MPA101 系（2 機種が同じ内釜 ARE50-M78）
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'SR-MPA101' then '本部品は SR-MPA101 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('SR-MPA101', 'SR-MPA102')
where p.name = '内釜 SR-MPA101';

insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id, null
from parts p, appliances a
where p.name = '蒸気ふた SR-MPA101' and a.model_number = 'SR-MPA101';

-- 2) SR-VSX101 系（5 機種共通 ARE50-M20 / M201）
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'SR-VSX101' then '本部品は SR-VSX101 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('SR-VSX101', 'SR-VSX100', 'SR-VSX108', 'SR-VSX109', 'SR-CVSX100')
where p.name in ('内釜 SR-VSX101', '内釜 SR-VSX101（後継）');

insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id, null
from parts p, appliances a
where p.name = '蒸気カバー SR-VSX101' and a.model_number = 'SR-VSX101';

-- 3) SR-FE101 系（3 機種共通 ARE50-M26）
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'SR-FE101' then '本部品は SR-FE101 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('SR-FE101', 'SR-FE109', 'SR-CFE109')
where p.name = '内釜 SR-FE101';

-- 4) NP-RY05 系（NP-RZ05 と内釜共通）
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'NP-RY05' then '本部品は NP-RY05 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('NP-RY05', 'NP-RZ05')
where p.name = '内釜 NP-RY05';

insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id, null
from parts p, appliances a
where p.name = '内ぶた NP-RY05' and a.model_number = 'NP-RY05';

-- 5) NJ-AWB10 系（NJ-AWBX10 と内釜共通）
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'NJ-AWB10' then '本部品は NJ-AWB10 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('NJ-AWB10', 'NJ-AWBX10')
where p.name = '内釜 NJ-AWB10';

-- 6) 残り（単一機種のみ）— part name 末尾の型番マッチで join
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id, null
from parts p
join appliances a on p.name like '%' || a.model_number
where not exists (
  select 1 from appliance_parts ap
  where ap.appliance_id = a.id and ap.part_id = p.id
);
