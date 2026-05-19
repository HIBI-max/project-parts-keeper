-- ============================================================
-- Parts Keeper — P0 シード v3（大規模拡充版）
--
-- 方針:
-- - 楽天市場に実物の販売実績がある主要メーカーの主力ライン中心
-- - 兄弟モデル（部品共通）も登録して n:m 関係を活用
-- - manufacturer_part_number は楽天 itemName から抽出した値のみ採用（discover 経由）
-- - 未確認の品番は null で、楽天検索は part name にフォールバック
-- - 部品名は "{部品カテゴリ和名} {代表型番}" 形式
-- ============================================================

-- ============================================================
-- appliances
-- ============================================================
insert into appliances
  (manufacturer, category, model_number, model_name, release_year, production_end_year, parts_retention_until, notes)
values
  -- ========== 炊飯器 / Panasonic SR-MPA 系（おどり炊き 5.5合）==========
  ('Panasonic', 'rice_cooker', 'SR-MPA101', 'おどり炊き 5.5合 IH圧力', 2021, 2024, 2030, 'SR-MPA102 と内釜共通 (ARE50-M78)。'),
  ('Panasonic', 'rice_cooker', 'SR-MPA102', 'おどり炊き 5.5合 IH圧力（後継）', 2022, 2024, 2030, 'SR-MPA101 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-MPA10', 'おどり炊き 5.5合 IH圧力（旧）', 2018, 2021, 2027, '前世代モデル。'),

  -- ========== 炊飯器 / Panasonic SR-VSX 系（Wおどり炊き 5.5合）==========
  ('Panasonic', 'rice_cooker', 'SR-VSX101', 'Wおどり炊き 5.5合 可変圧力IH', 2020, 2023, 2029, '内釜 ARE50-M20。同系 5 機種共通。'),
  ('Panasonic', 'rice_cooker', 'SR-VSX100', 'Wおどり炊き 5.5合 可変圧力IH（前モデル）', 2019, 2022, 2028, 'SR-VSX101 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-VSX108', 'Wおどり炊き 5.5合 可変圧力IH（カラー違い）', 2020, 2023, 2029, 'SR-VSX101 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-VSX109', 'Wおどり炊き 5.5合 可変圧力IH（後継）', 2021, 2024, 2030, 'SR-VSX101 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-CVSX100', 'Wおどり炊き 5.5合 ハイエンド', 2019, 2022, 2028, 'SR-VSX101 と内釜共通。'),

  -- ========== 炊飯器 / Panasonic SR-FE 系（シンプル IH 5.5合）==========
  ('Panasonic', 'rice_cooker', 'SR-FE101', 'IH炊飯器 5.5合 シンプル', 2019, 2022, 2028, '内釜 ARE50-M26。同系 3 機種共通。'),
  ('Panasonic', 'rice_cooker', 'SR-FE109', 'IH炊飯器 5.5合 シンプル（後継）', 2020, 2023, 2029, 'SR-FE101 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-CFE109', 'IH炊飯器 5.5合 シンプル（カラー違い）', 2020, 2023, 2029, 'SR-FE101 と内釜共通。'),

  -- ========== 炊飯器 / Panasonic SR-FD 系（旧シリーズ、互換部品 ARE50-H74）==========
  ('Panasonic', 'rice_cooker', 'SR-FD108', 'IH炊飯器 5.5合 シンプル（旧）', 2017, 2020, 2026, '内釜 ARE50-H74。同系 4 機種共通。'),
  ('Panasonic', 'rice_cooker', 'SR-FD109', 'IH炊飯器 5.5合 シンプル（旧）', 2018, 2021, 2027, 'SR-FD108 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-FD106', 'IH炊飯器 5.5合 シンプル（旧）', 2016, 2019, 2025, 'SR-FD108 と内釜共通。部品保有期間まもなく終了。'),
  ('Panasonic', 'rice_cooker', 'SR-FD107', 'IH炊飯器 5.5合 シンプル（旧）', 2017, 2020, 2026, 'SR-FD108 と内釜共通。'),
  ('Panasonic', 'rice_cooker', 'SR-HVD1090', 'IH炊飯器 5.5合（HVD系）', 2018, 2021, 2027, 'SR-FD 系と内釜共通。'),

  -- ========== 炊飯器 / Panasonic その他（普及機）==========
  ('Panasonic', 'rice_cooker', 'SR-NB10', 'IH炊飯器 5.5合 普及機', 2019, 2022, 2028, null),
  ('Panasonic', 'rice_cooker', 'SR-PBA10', 'IH炊飯器 5.5合 上位', 2020, 2023, 2029, null),

  -- ========== 炊飯器 / 象印 NW 系（炎舞炊き・極め炊き）==========
  ('象印', 'rice_cooker', 'NW-JZ10', '炎舞炊き 5.5合 圧力IH', 2022, null, null, '内釜 B654-6B。継続販売中。'),
  ('象印', 'rice_cooker', 'NW-LA10', '炎舞炊き 5.5合 圧力IH', 2018, 2021, 2027, '内釜 B575-6B。'),
  ('象印', 'rice_cooker', 'NW-JC10', '炎舞炊き 5.5合 圧力IH', 2020, 2023, 2029, null),
  ('象印', 'rice_cooker', 'NW-NA10', '極め炊き 5.5合 IH', 2020, 2023, 2029, null),
  ('象印', 'rice_cooker', 'NW-VC10', '極め炊き 5.5合 IH 普及機', 2019, 2022, 2028, null),

  -- ========== 炊飯器 / 象印 NP 系（3合・10合）==========
  ('象印', 'rice_cooker', 'NP-RY05', '極め炊き 3合 圧力IH', 2020, 2023, 2029, '内釜 B527-6B。NP-RZ05 と共通。'),
  ('象印', 'rice_cooker', 'NP-RZ05', '極め炊き 3合 圧力IH', 2019, 2022, 2028, 'NP-RY05 と内釜共通。'),
  ('象印', 'rice_cooker', 'NP-BD18', '極め炊き 1升 圧力IH', 2021, 2024, 2030, null),

  -- ========== 炊飯器 / タイガー JPI 系（ご泡火炊き）==========
  ('タイガー魔法瓶', 'rice_cooker', 'JPI-A100', 'ご泡火炊き 5.5合 圧力IH', 2020, 2023, 2029, '土鍋コーティング、内釜 5 年保証。'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPI-T100', 'ご泡火炊き土鍋 5.5合 圧力IH', 2021, 2024, 2030, '本土鍋採用。'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPL-G100', 'ご泡火炊き 5.5合 圧力IH 上位', 2021, 2024, 2030, null),
  ('タイガー魔法瓶', 'rice_cooker', 'JPL-S100', 'ご泡火炊き 5.5合 圧力IH', 2020, 2023, 2029, null),

  -- ========== 炊飯器 / タイガー JPC 系（タクック・マイコン）==========
  ('タイガー魔法瓶', 'rice_cooker', 'JPC-G100', 'タクック 5.5合 マイコン', 2018, 2021, 2027, '内ぶた JPC1139。JPC-A100/B100 系互換。'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPC-A100', 'タクック 5.5合 マイコン（旧）', 2016, 2019, 2025, 'JPC-G100 と内ぶた共通。'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPC-B100', 'タクック 5.5合 マイコン（旧）', 2017, 2020, 2026, 'JPC-G100 と内ぶた共通。'),

  -- ========== 炊飯器 / 東芝 RC 系（真空圧力IH）==========
  ('東芝', 'rice_cooker', 'RC-10VXV', '真空圧力IH 5.5合', 2020, 2023, 2029, '内ぶた 320A2450。RC-100VXS など互換。'),
  ('東芝', 'rice_cooker', 'RC-100VXS', '真空圧力IH 5.5合', 2019, 2022, 2028, 'RC-10VXV と内ぶた共通。'),
  ('東芝', 'rice_cooker', 'RC-10E8VS', '真空圧力IH 5.5合', 2018, 2021, 2027, 'RC-10VXV と内ぶた共通。'),
  ('東芝', 'rice_cooker', 'RC-10E8VX', '真空圧力IH 5.5合', 2018, 2021, 2027, 'RC-10VXV と内ぶた共通。'),
  ('東芝', 'rice_cooker', 'RC-10ZWN', '真空圧力IH 5.5合（上位）', 2021, 2024, 2030, null),

  -- ========== 炊飯器 / 三菱電機 NJ 系（本炭釜）==========
  ('三菱電機', 'rice_cooker', 'NJ-AWB10', '本炭釜 5.5合 IH', 2021, 2024, 2030, '内釜 M15X16340。NJ-AWBX10 と共通。'),
  ('三菱電機', 'rice_cooker', 'NJ-AWBX10', '本炭釜 5.5合 IH（上位）', 2021, 2024, 2030, 'NJ-AWB10 と内釜共通。'),
  ('三菱電機', 'rice_cooker', 'NJ-VWB10', '炭炊釜 5.5合 IH', 2020, 2023, 2029, null),
  ('三菱電機', 'rice_cooker', 'NJ-VWA10', '炭炊釜 5.5合 IH（旧）', 2019, 2022, 2028, null),

  -- ========== 炊飯器 / 日立 RZ 系（ふっくら御膳）==========
  ('日立', 'rice_cooker', 'RZ-AC10M', 'ふっくら御膳 5.5合 圧力IH', 2020, 2023, 2029, null),
  ('日立', 'rice_cooker', 'RZ-W100EM', 'ふっくら御膳 5.5合 圧力スチームIH', 2020, 2023, 2029, null),

  -- ========================================================
  -- 洗濯機
  -- ========================================================
  ('Panasonic', 'washing_machine', 'NA-FA8H1', '全自動洗濯機 8kg', 2020, 2023, 2029, null),
  ('Panasonic', 'washing_machine', 'NA-FA8K2', '全自動洗濯機 8kg', 2022, null, null, '継続販売中。'),
  ('Panasonic', 'washing_machine', 'NA-VX900AL', 'ドラム式 11kg ヒートポンプ', 2020, 2023, 2029, null),
  ('Panasonic', 'washing_machine', 'NA-LX129AL', 'ドラム式 12kg ヒートポンプ', 2022, null, null, null),
  ('日立', 'washing_machine', 'BW-V100J', 'ビートウォッシュ 10kg', 2021, 2024, 2030, null),
  ('日立', 'washing_machine', 'BW-X100J', 'ビートウォッシュ 10kg（上位）', 2022, null, null, null),
  ('日立', 'washing_machine', 'BW-DV100D', 'ビッグドラム 10kg', 2020, 2023, 2029, null),
  ('日立', 'washing_machine', 'BW-DV80D', 'ビッグドラム 8kg', 2020, 2023, 2029, null),
  ('シャープ', 'washing_machine', 'ES-GV9F', '穴なし槽 9kg', 2020, 2023, 2029, null),
  ('シャープ', 'washing_machine', 'ES-W113', 'ドラム式 11kg プラズマクラスター', 2021, 2024, 2030, null),
  ('東芝', 'washing_machine', 'AW-10VP3', 'ZABOON 10kg', 2021, 2024, 2030, null),
  ('東芝', 'washing_machine', 'AW-12XD9', 'ZABOON 12kg', 2020, 2023, 2029, null),

  -- ========================================================
  -- 掃除機
  -- ========================================================
  ('シャープ', 'vacuum', 'EC-PX700', 'コードレススティック', 2014, 2017, 2023, '部品保有期間既に終了。互換バッテリーのみ流通。'),
  ('シャープ', 'vacuum', 'EC-VR3S', 'RACTIVE Air コードレス', 2020, 2023, 2029, null),
  ('シャープ', 'vacuum', 'EC-AR2SX', 'RACTIVE Air プレミアム', 2021, 2024, 2030, null),
  ('ダイソン', 'vacuum', 'V12 Detect Slim', 'コードレススティック', 2021, null, null, 'バッテリーが消耗品。'),
  ('ダイソン', 'vacuum', 'V11', 'コードレススティック', 2019, 2022, 2028, null),
  ('ダイソン', 'vacuum', 'V15 Detect', 'コードレススティック ハイエンド', 2021, null, null, null),
  ('Panasonic', 'vacuum', 'MC-SB85J', 'パワーコードレス', 2020, 2023, 2029, null),
  ('Panasonic', 'vacuum', 'MC-SBV02J', 'パワーコードレス（上位）', 2021, 2024, 2030, null),
  ('Panasonic', 'vacuum', 'MC-PA10G', '紙パック式キャニスター', 2020, 2023, 2029, null),
  ('日立', 'vacuum', 'PV-BL30J', 'パワかるスティック', 2021, 2024, 2030, null),
  ('日立', 'vacuum', 'PV-BFH900', 'パワーブーストサイクロン', 2020, 2023, 2029, null),
  ('マキタ', 'vacuum', 'CL182FD', 'コードレス掃除機 18V', 2018, null, null, '業務用も多用される定番。'),

  -- ========================================================
  -- エアコン
  -- ========================================================
  ('Panasonic', 'air_conditioner', 'CS-X401D2', 'エオリア X 14畳', 2021, 2024, 2034, 'お掃除ロボ搭載。'),
  ('Panasonic', 'air_conditioner', 'CS-X561D2', 'エオリア X 18畳', 2021, 2024, 2034, null),
  ('Panasonic', 'air_conditioner', 'CS-EX401D', 'エオリア EX 14畳', 2021, 2024, 2034, null),
  ('ダイキン', 'air_conditioner', 'AN40YEP-W', 'うるるとさらら R 14畳', 2021, 2024, 2034, null),
  ('ダイキン', 'air_conditioner', 'AN56VEP-W', 'うるるとさらら V 18畳', 2021, 2024, 2034, null),
  ('ダイキン', 'air_conditioner', 'AN63YEP-W', 'うるるとさらら R 20畳', 2021, 2024, 2034, null),
  ('日立', 'air_conditioner', 'RAS-D40K', '白くまくん 14畳', 2020, 2023, 2033, null),
  ('日立', 'air_conditioner', 'RAS-X40K', '白くまくん X 14畳', 2020, 2023, 2033, null),
  ('日立', 'air_conditioner', 'RAS-XJ40K', '白くまくん XJ 14畳', 2020, 2023, 2033, null),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW4022S', '霧ヶ峰 Zシリーズ 14畳', 2022, null, null, '継続販売中。'),
  ('三菱電機', 'air_conditioner', 'MSZ-FZ4022S', '霧ヶ峰 FZ 14畳', 2022, null, null, null),
  ('三菱電機', 'air_conditioner', 'MSZ-GE4022', '霧ヶ峰 GE 14畳', 2022, null, null, null),

  -- ========================================================
  -- 電子レンジ
  -- ========================================================
  ('Panasonic', 'microwave', 'NE-BS807', 'ビストロ 30L スチームオーブン', 2020, 2023, 2029, null),
  ('Panasonic', 'microwave', 'NE-BS906', 'ビストロ 30L 上位', 2021, 2024, 2030, null),
  ('Panasonic', 'microwave', 'NE-BS909', 'ビストロ 30L 最上位', 2022, null, null, null),
  ('日立', 'microwave', 'MRO-W10X', 'ヘルシーシェフ 30L', 2021, 2024, 2030, null),
  ('日立', 'microwave', 'MRO-S8X', 'ヘルシーシェフ 30L 普及機', 2020, 2023, 2029, null),
  ('日立', 'microwave', 'MRO-W1A', 'ヘルシーシェフ 30L 上位', 2022, null, null, null),
  ('東芝', 'microwave', 'ER-RD3000', '石窯ドーム 30L', 2020, 2023, 2029, null),
  ('東芝', 'microwave', 'ER-VD3000', '石窯ドーム 30L 上位', 2021, 2024, 2030, null),
  ('東芝', 'microwave', 'ER-SD3000', '石窯ドーム 30L', 2021, 2024, 2030, null),
  ('シャープ', 'microwave', 'AX-XA20', 'ヘルシオ 30L ウォーターオーブン', 2021, 2024, 2030, null),
  ('シャープ', 'microwave', 'AX-HA20', 'ヘルシオ 30L 普及機', 2020, 2023, 2029, null),

  -- ========================================================
  -- 冷蔵庫
  -- ========================================================
  ('Panasonic', 'refrigerator', 'NR-F507WPX', 'はやうま冷凍 500L', 2021, 2024, 2030, null),
  ('Panasonic', 'refrigerator', 'NR-F557WPX', 'はやうま冷凍 550L', 2021, 2024, 2030, null),
  ('Panasonic', 'refrigerator', 'NR-F606WPX', 'はやうま冷凍 600L', 2022, null, null, null),
  ('日立', 'refrigerator', 'R-HW54R', 'まんなか野菜 540L', 2022, null, null, null),
  ('日立', 'refrigerator', 'R-WX67R', 'まんなか野菜 670L', 2022, null, null, null),
  ('日立', 'refrigerator', 'R-XG56R', 'まんなか野菜 565L', 2021, 2024, 2030, null),
  ('三菱電機', 'refrigerator', 'MR-WX60G', '置けるスマート大容量 600L', 2021, 2024, 2030, null),
  ('三菱電機', 'refrigerator', 'MR-WX52G', '置けるスマート大容量 525L', 2021, 2024, 2030, null),
  ('東芝', 'refrigerator', 'GR-T550FZ', 'ベジータ 551L', 2021, 2024, 2030, 'ドアパッキン 44066330/44066331、野菜ケース 44082555。'),
  ('東芝', 'refrigerator', 'GR-T600FZ', 'ベジータ 601L', 2021, 2024, 2030, 'GR-T550FZ と冷凍室ドアパッキン共通。'),
  ('シャープ', 'refrigerator', 'SJ-X550J', '両開き 550L', 2021, 2024, 2030, null);

-- ============================================================
-- parts（共通部品は 1 件、appliance_parts で複数機種に紐付ける）
-- ============================================================
insert into parts
  (name, category, kind, manufacturer, manufacturer_part_number, description)
values
  -- Panasonic SR-MPA 系
  ('内釜 SR-MPA101', 'inner_pot', 'oem', 'Panasonic', 'ARE50-M78', 'ダイヤモンド竈釜。SR-MPA101/102 共通。'),
  ('蒸気ふた SR-MPA101', 'gasket', 'oem', 'Panasonic', null, null),
  ('内釜 SR-MPA10', 'inner_pot', 'oem', 'Panasonic', null, '旧 おどり炊き用。'),

  -- Panasonic SR-VSX 系（5 機種共通）
  ('内釜 SR-VSX101', 'inner_pot', 'oem', 'Panasonic', 'ARE50-M20', 'SR-VSX100/101/108/109・SR-CVSX100 共通。'),
  ('内釜 SR-VSX101（後継）', 'inner_pot', 'oem', 'Panasonic', 'ARE50-M201', 'ARE50-M20 の後継品。同系全機種互換。'),
  ('蒸気カバー SR-VSX101', 'gasket', 'oem', 'Panasonic', null, null),

  -- Panasonic SR-FE 系（3 機種共通）
  ('内釜 SR-FE101', 'inner_pot', 'oem', 'Panasonic', 'ARE50-M26', 'SR-FE101/109・SR-CFE109 共通。'),

  -- Panasonic SR-FD 系（5 機種共通、旧シリーズ）
  ('内釜 SR-FD108', 'inner_pot', 'oem', 'Panasonic', 'ARE50-H74', 'SR-FD106/107/108/109・SR-HVD1090 共通。'),

  -- Panasonic 単独機種
  ('内釜 SR-NB10', 'inner_pot', 'oem', 'Panasonic', null, null),
  ('内釜 SR-PBA10', 'inner_pot', 'oem', 'Panasonic', null, null),

  -- 象印 NW 系
  ('内釜 NW-JZ10', 'inner_pot', 'oem', '象印', 'B654-6B', '豪炎かまど釜。'),
  ('内ぶた NW-JZ10', 'gasket', 'oem', '象印', null, null),
  ('内釜 NW-LA10', 'inner_pot', 'oem', '象印', 'B575-6B', '鉄器コート豪炎かまど釜。'),
  ('内釜 NW-JC10', 'inner_pot', 'oem', '象印', null, null),
  ('内釜 NW-NA10', 'inner_pot', 'oem', '象印', null, null),
  ('内釜 NW-VC10', 'inner_pot', 'oem', '象印', null, null),

  -- 象印 NP 系
  ('内釜 NP-RY05', 'inner_pot', 'oem', '象印', 'B527-6B', '3 合用。NP-RY05/RZ05 共通。'),
  ('内ぶた NP-RY05', 'gasket', 'oem', '象印', null, null),
  ('内釜 NP-BD18', 'inner_pot', 'oem', '象印', null, '1 升用。'),

  -- タイガー JPI/JPL 系
  ('内釜 JPI-A100', 'inner_pot', 'oem', 'タイガー魔法瓶', null, '本土鍋（5 年保証）。'),
  ('内ぶた JPI-A100', 'gasket', 'oem', 'タイガー魔法瓶', null, null),
  ('内釜 JPI-T100', 'inner_pot', 'oem', 'タイガー魔法瓶', null, '土鍋採用。'),
  ('内釜 JPL-G100', 'inner_pot', 'oem', 'タイガー魔法瓶', null, null),
  ('内釜 JPL-S100', 'inner_pot', 'oem', 'タイガー魔法瓶', null, null),

  -- タイガー JPC 系（3 機種共通）
  ('内釜 JPC-G100', 'inner_pot', 'oem', 'タイガー魔法瓶', null, null),
  ('内ぶた JPC-G100', 'gasket', 'oem', 'タイガー魔法瓶', 'JPC1139', 'JPC-A100/B100/G100 系互換、負圧パッキン含む。'),

  -- 東芝 RC 系（5 機種共通の内ぶた）
  ('内釜 RC-10VXV', 'inner_pot', 'oem', '東芝', null, '備長炭コート。'),
  ('内ぶた RC-10VXV', 'gasket', 'oem', '東芝', '320A2450', '5.5合用内蓋。RC-10VXV/100VXS/10E8VS/10E8VX 互換。'),
  ('内釜 RC-10ZWN', 'inner_pot', 'oem', '東芝', null, null),

  -- 三菱 NJ 系
  ('内釜 NJ-AWB10', 'inner_pot', 'oem', '三菱電機', 'M15X16340', '本炭釜。NJ-AWB10/AWBX10 共通。'),
  ('内釜 NJ-VWB10', 'inner_pot', 'oem', '三菱電機', null, '炭炊釜。'),
  ('内釜 NJ-VWA10', 'inner_pot', 'oem', '三菱電機', null, null),

  -- 日立
  ('内釜 RZ-AC10M', 'inner_pot', 'oem', '日立', null, null),
  ('内釜 RZ-W100EM', 'inner_pot', 'oem', '日立', null, null),

  -- ===== 洗濯機 =====
  ('糸くずフィルター NA-FA8H1', 'filter', 'oem', 'Panasonic', null, null),
  ('給水ホース NA-FA8H1', 'other', 'oem', 'Panasonic', null, null),
  ('糸くずフィルター NA-FA8K2', 'filter', 'oem', 'Panasonic', null, null),
  ('乾燥フィルター NA-VX900AL', 'filter', 'oem', 'Panasonic', null, 'ドラム式の乾燥側。'),
  ('乾燥フィルター NA-LX129AL', 'filter', 'oem', 'Panasonic', null, null),
  ('糸くずフィルター BW-V100J', 'filter', 'oem', '日立', null, null),
  ('糸くずフィルター BW-X100J', 'filter', 'oem', '日立', null, null),
  ('乾燥フィルター BW-DV100D', 'filter', 'oem', '日立', null, null),
  ('乾燥フィルター BW-DV80D', 'filter', 'oem', '日立', null, null),
  ('糸くずフィルター ES-GV9F', 'filter', 'oem', 'シャープ', null, null),
  ('乾燥フィルター ES-W113', 'filter', 'oem', 'シャープ', null, null),
  ('糸くずフィルター AW-10VP3', 'filter', 'oem', '東芝', null, null),
  ('糸くずフィルター AW-12XD9', 'filter', 'oem', '東芝', null, null),

  -- ===== 掃除機 =====
  ('バッテリー EC-PX700 互換', 'battery', 'compatible', 'サードパーティ', null, '純正品終売のため互換のみ流通。'),
  ('床用ブラシ EC-PX700', 'brush', 'oem', 'シャープ', null, null),
  ('バッテリー EC-VR3S', 'battery', 'oem', 'シャープ', null, null),
  ('バッテリー EC-AR2SX', 'battery', 'oem', 'シャープ', null, null),
  ('バッテリー V12 Detect Slim', 'battery', 'oem', 'ダイソン', null, 'Dyson 公式オンラインを推奨。'),
  ('バッテリー V11', 'battery', 'oem', 'ダイソン', null, null),
  ('バッテリー V15 Detect', 'battery', 'oem', 'ダイソン', null, null),
  ('バッテリー MC-SB85J', 'battery', 'oem', 'Panasonic', null, null),
  ('バッテリー MC-SBV02J', 'battery', 'oem', 'Panasonic', null, null),
  ('紙パック MC-PA10G', 'bag', 'oem', 'Panasonic', null, '5 枚入り標準。'),
  ('バッテリー PV-BL30J', 'battery', 'oem', '日立', null, null),
  ('バッテリー PV-BFH900', 'battery', 'oem', '日立', null, null),
  ('バッテリー CL182FD', 'battery', 'oem', 'マキタ', null, '18V Li-ion BL1860B 等互換多数。'),

  -- ===== エアコン =====
  ('フィルター CS-X401D2', 'filter', 'oem', 'Panasonic', null, null),
  ('リモコン CS-X401D2', 'remote', 'oem', 'Panasonic', null, null),
  ('フィルター CS-X561D2', 'filter', 'oem', 'Panasonic', null, null),
  ('フィルター CS-EX401D', 'filter', 'oem', 'Panasonic', null, null),
  ('フィルター AN40YEP-W', 'filter', 'oem', 'ダイキン', null, null),
  ('リモコン AN40YEP-W', 'remote', 'oem', 'ダイキン', null, null),
  ('フィルター AN56VEP-W', 'filter', 'oem', 'ダイキン', null, null),
  ('フィルター AN63YEP-W', 'filter', 'oem', 'ダイキン', null, null),
  ('フィルター RAS-D40K', 'filter', 'oem', '日立', null, null),
  ('リモコン RAS-D40K', 'remote', 'oem', '日立', null, null),
  ('フィルター RAS-X40K', 'filter', 'oem', '日立', null, null),
  ('フィルター RAS-XJ40K', 'filter', 'oem', '日立', null, null),
  ('フィルター MSZ-ZW4022S', 'filter', 'oem', '三菱電機', null, null),
  ('リモコン MSZ-ZW4022S', 'remote', 'oem', '三菱電機', null, null),
  ('フィルター MSZ-FZ4022S', 'filter', 'oem', '三菱電機', null, null),
  ('フィルター MSZ-GE4022', 'filter', 'oem', '三菱電機', null, null),

  -- ===== 電子レンジ =====
  ('ターンテーブル NE-BS807', 'turntable', 'oem', 'Panasonic', null, null),
  ('扉パッキン NE-BS807', 'gasket', 'oem', 'Panasonic', null, null),
  ('ターンテーブル NE-BS906', 'turntable', 'oem', 'Panasonic', null, null),
  ('ターンテーブル NE-BS909', 'turntable', 'oem', 'Panasonic', null, null),
  ('ターンテーブル MRO-W10X', 'turntable', 'oem', '日立', null, null),
  ('ターンテーブル MRO-S8X', 'turntable', 'oem', '日立', null, null),
  ('ターンテーブル MRO-W1A', 'turntable', 'oem', '日立', null, null),
  ('ターンテーブル ER-RD3000', 'turntable', 'oem', '東芝', null, null),
  ('ターンテーブル ER-VD3000', 'turntable', 'oem', '東芝', null, null),
  ('ターンテーブル ER-SD3000', 'turntable', 'oem', '東芝', null, null),
  ('ターンテーブル AX-XA20', 'turntable', 'oem', 'シャープ', null, null),
  ('ターンテーブル AX-HA20', 'turntable', 'oem', 'シャープ', null, null),

  -- ===== 冷蔵庫 =====
  ('製氷皿 NR-F507WPX', 'ice_tray', 'oem', 'Panasonic', null, '自動製氷ユニット。'),
  ('野菜ケース NR-F507WPX', 'other', 'oem', 'Panasonic', null, null),
  ('ドアパッキン NR-F507WPX', 'gasket', 'oem', 'Panasonic', null, null),
  ('製氷皿 NR-F557WPX', 'ice_tray', 'oem', 'Panasonic', null, null),
  ('製氷皿 NR-F606WPX', 'ice_tray', 'oem', 'Panasonic', null, null),
  ('製氷皿 R-HW54R', 'ice_tray', 'oem', '日立', null, null),
  ('製氷皿 R-WX67R', 'ice_tray', 'oem', '日立', null, null),
  ('製氷皿 R-XG56R', 'ice_tray', 'oem', '日立', null, null),
  ('製氷皿 MR-WX60G', 'ice_tray', 'oem', '三菱電機', null, null),
  ('製氷皿 MR-WX52G', 'ice_tray', 'oem', '三菱電機', null, null),
  ('製氷皿 GR-T550FZ', 'ice_tray', 'oem', '東芝', null, null),
  ('野菜ケース GR-T550FZ', 'other', 'oem', '東芝', '44082555', '純正部品。'),
  ('上冷凍室ドアパッキン GR-T550FZ', 'gasket', 'oem', '東芝', '44066330', 'GR-T550FZ/T600FZ 共通。'),
  ('下冷凍室ドアパッキン GR-T550FZ', 'gasket', 'oem', '東芝', '44066331', 'GR-T550FZ/T600FZ 共通。'),
  ('製氷皿 GR-T600FZ', 'ice_tray', 'oem', '東芝', null, null),
  ('製氷皿 SJ-X550J', 'ice_tray', 'oem', 'シャープ', null, null);

-- ============================================================
-- appliance_parts: 共通部品の明示的な n:m リレーション
-- ============================================================

-- SR-MPA 系 (内釜 ARE50-M78 → 2 機種)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'SR-MPA101' then '本部品は SR-MPA101 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('SR-MPA101', 'SR-MPA102')
where p.name = '内釜 SR-MPA101';

-- SR-VSX 系 (内釜 ARE50-M20 / M201 → 5 機種)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'SR-VSX101' then '本部品は SR-VSX101 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('SR-VSX101', 'SR-VSX100', 'SR-VSX108', 'SR-VSX109', 'SR-CVSX100')
where p.name in ('内釜 SR-VSX101', '内釜 SR-VSX101（後継）');

-- SR-FE 系 (内釜 ARE50-M26 → 3 機種)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'SR-FE101' then '本部品は SR-FE101 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('SR-FE101', 'SR-FE109', 'SR-CFE109')
where p.name = '内釜 SR-FE101';

-- SR-FD 系 (内釜 ARE50-H74 → 5 機種)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'SR-FD108' then '本部品は SR-FD108 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('SR-FD108', 'SR-FD109', 'SR-FD106', 'SR-FD107', 'SR-HVD1090')
where p.name = '内釜 SR-FD108';

-- NP-RY 系 (内釜 B527-6B → 2 機種)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'NP-RY05' then '本部品は NP-RY05 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('NP-RY05', 'NP-RZ05')
where p.name = '内釜 NP-RY05';

-- JPC 系 (内ぶた JPC1139 → 3 機種)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'JPC-G100' then '本部品は JPC-G100 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('JPC-G100', 'JPC-A100', 'JPC-B100')
where p.name = '内ぶた JPC-G100';

-- RC 系 (内ぶた 320A2450 → 4 機種)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'RC-10VXV' then '本部品は RC-10VXV 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('RC-10VXV', 'RC-100VXS', 'RC-10E8VS', 'RC-10E8VX')
where p.name = '内ぶた RC-10VXV';

-- NJ-AWB 系 (内釜 M15X16340 → 2 機種)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'NJ-AWB10' then '本部品は NJ-AWB10 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('NJ-AWB10', 'NJ-AWBX10')
where p.name = '内釜 NJ-AWB10';

-- 東芝 冷蔵庫 ドアパッキン (GR-T550FZ/T600FZ 共通)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id,
  case when a.model_number <> 'GR-T550FZ' then '本部品は GR-T550FZ 用として登録、本機種にも適合' else null end
from parts p
join appliances a on a.model_number in ('GR-T550FZ', 'GR-T600FZ')
where p.name in ('上冷凍室ドアパッキン GR-T550FZ', '下冷凍室ドアパッキン GR-T550FZ');

-- 単一機種紐付け (part 名末尾の型番マッチ、未紐付けのみ)
insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id, null
from parts p
join appliances a on p.name like '%' || a.model_number
where not exists (
  select 1 from appliance_parts ap
  where ap.appliance_id = a.id and ap.part_id = p.id
);

-- ============================================================
-- discover-parts.ts 由来の品番補完 + image_url 反映
-- 楽天タイトルから抽出した実在検証済みのデータのみ
-- ============================================================

-- 新発見の確定品番
update parts set manufacturer_part_number = 'B531-6B' where name = '内釜 NW-JC10';
update parts set manufacturer_part_number = 'B670-6B' where name = '内釜 NW-NA10';
update parts set manufacturer_part_number = 'B585-6B' where name = '内釜 NW-VC10';
update parts set manufacturer_part_number = 'M15W96340' where name = '内釜 NJ-VWA10';
update parts set manufacturer_part_number = 'M15X18340' where name = '内釜 NJ-VWB10';
update parts set manufacturer_part_number = 'ARE50-M51' where name = '内釜 SR-MPA10';
update parts set manufacturer_part_number = 'ARE50-M99' where name = '内釜 SR-NB10';
update parts set manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-FA8K2';

-- 新規部品（既存 parts に無いもの）
insert into parts (name, category, kind, manufacturer, manufacturer_part_number, description)
values
  ('紙パック EC-VR3S', 'bag', 'oem', 'シャープ', '2173370564', 'シャープ掃除機 高性能プリーツ。2 個入。'),
  ('野菜ケース GR-T600FZ', 'other', 'oem', '東芝', '44082553', '純正部品。GR-T550FZ とは別品番。')
on conflict do nothing;

insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id, null
from parts p
join appliances a on p.name like '%' || a.model_number
where p.manufacturer_part_number in ('2173370564', '44082553')
and not exists (
  select 1 from appliance_parts ap
  where ap.appliance_id = a.id and ap.part_id = p.id
);

-- Auto-generated from discover-output.json
-- 品番抽出ができたクエリ（=実商品が該当）の image_url のみ採用

update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1369/58078133368_1.jpg?_ex=128x128' where name = '糸くずフィルター NA-FA8K2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-m26.jpg?_ex=128x128' where name = '内釜 SR-CFE109' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m20/pn1are50m20-02.jpg?_ex=128x128' where name = '内釜 SR-CVSX100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden2/are50h74.jpg?_ex=128x128' where name = '内釜 SR-FD106' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden2/are50h74.jpg?_ex=128x128' where name = '内釜 SR-FD107' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-h74.jpg?_ex=128x128' where name = '内釜 SR-FD108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-h74.jpg?_ex=128x128' where name = '内釜 SR-FD109' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-m26.jpg?_ex=128x128' where name = '内釜 SR-FE101' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-m26.jpg?_ex=128x128' where name = '内釜 SR-FE109' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-m88.jpg?_ex=128x128' where name = '内釜 SR-MPA10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/partscomstore/cabinet/shohin01/panasonic/pa006001/are50-m78.jpg?_ex=128x128' where name = '内釜 SR-MPA101' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/partscomstore/cabinet/shohin01/panasonic/pa006001/are50-m78.jpg?_ex=128x128' where name = '内釜 SR-MPA102' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/partscomstore/cabinet/shohin01/panasonic/pa006001/are50-m99.jpg?_ex=128x128' where name = '内釜 SR-NB10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m20/pn1are50m20-02.jpg?_ex=128x128' where name = '内釜 SR-VSX100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m20/pn1are50m20-02.jpg?_ex=128x128' where name = '内釜 SR-VSX101' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m20/pn1are50m20-02.jpg?_ex=128x128' where name = '内釜 SR-VSX108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m20/pn1are50m20-02.jpg?_ex=128x128' where name = '内釜 SR-VSX109' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/selectshopdaysmarket/cabinet/bulk_212/5000000112473_1.jpg?_ex=128x128' where name = '紙パック EC-VR3S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kadecoco/cabinet/buhin/jpc1139n.jpg?_ex=128x128' where name = '内ぶた JPC-A100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kadecoco/cabinet/buhin/jpc1139n.jpg?_ex=128x128' where name = '内ぶた JPC-B100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kadecoco/cabinet/buhin/jpc1139n.jpg?_ex=128x128' where name = '内ぶた JPC-G100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-parts/m15x16340.jpg?_ex=128x128' where name = '内釜 NJ-AWB10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/mitsubishi/imgrc0056547244.jpg?_ex=128x128' where name = '内釜 NJ-AWBX10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-m1/m15w96340.jpg?_ex=128x128' where name = '内釜 NJ-VWA10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-m1/m15x18340.jpg?_ex=128x128' where name = '内釜 NJ-VWB10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/44066331.jpg?_ex=128x128' where name = 'ドアパッキン GR-T550FZ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/44082555.jpg?_ex=128x128' where name = '野菜ケース GR-T550FZ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/44066331.jpg?_ex=128x128' where name = 'ドアパッキン GR-T600FZ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/44082553.jpg?_ex=128x128' where name = '野菜ケース GR-T600FZ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww305.jpg?_ex=128x128' where name = '内釜 RC-100VXS' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/imgrc0166818444.jpg?_ex=128x128' where name = '内ぶた RC-100VXS' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/imgrc0166818444.jpg?_ex=128x128' where name = '内ぶた RC-10E8VS' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/imgrc0166818444.jpg?_ex=128x128' where name = '内ぶた RC-10E8VX' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/imgrc0166818444.jpg?_ex=128x128' where name = '内ぶた RC-10VXV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b527-6b.jpg?_ex=128x128' where name = '内釜 NP-RY05' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b527-6b.jpg?_ex=128x128' where name = '内釜 NP-RZ05' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/a-price/cabinet/orj/17/0-4974305220264.jpg?_ex=128x128' where name = '内釜 NW-JC10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kadecoco/cabinet/buhin/b654-6b.jpg?_ex=128x128' where name = '内釜 NW-JZ10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b575-6b.jpg?_ex=128x128' where name = '内釜 NW-LA10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/konan/cabinet/ki114/4974305170323_1.jpg?_ex=128x128' where name = '内釜 NW-NA10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kadecoco/cabinet/buhin/b5856b.jpg?_ex=128x128' where name = '内釜 NW-VC10' and image_url is null;
-- ============================================================
-- discover-appliances.ts 由来 v2-balanced (カテゴリ別配分)
-- ============================================================
insert into appliances (manufacturer, category, model_number) values
  ('ダイソン', 'vacuum', 'V8 Absolute'),
  ('シャープ', 'vacuum', 'EC-AP500'),
  ('シャープ', 'vacuum', 'EC-AR2S'),
  ('シャープ', 'vacuum', 'EC-AS500'),
  ('シャープ', 'vacuum', 'EC-AS510'),
  ('シャープ', 'vacuum', 'EC-AS710'),
  ('シャープ', 'vacuum', 'EC-SX210'),
  ('シャープ', 'vacuum', 'EC-SX310'),
  ('シャープ', 'vacuum', 'EC-SX320'),
  ('シャープ', 'vacuum', 'EC-SX520'),
  ('シャープ', 'vacuum', 'EC-PR10'),
  ('シャープ', 'vacuum', 'EC-SR11'),
  ('シャープ', 'vacuum', 'EC-AR3S'),
  ('シャープ', 'vacuum', 'EC-FR5'),
  ('シャープ', 'vacuum', 'EC-AH2R'),
  ('シャープ', 'vacuum', 'EC-AH5'),
  ('シャープ', 'vacuum', 'EC-FR10'),
  ('シャープ', 'vacuum', 'EC-KR2'),
  ('シャープ', 'vacuum', 'EC-AR11'),
  ('日立', 'vacuum', 'PV-BL50J'),
  ('日立', 'vacuum', 'PV-BEH800'),
  ('日立', 'vacuum', 'PV-BFH500'),
  ('シャープ', 'vacuum', 'EC-AR7'),
  ('シャープ', 'vacuum', 'EC-SR3S'),
  ('日立', 'vacuum', 'PV-BH500G'),
  ('日立', 'vacuum', 'PV-BH900G'),
  ('日立', 'vacuum', 'PV-BT5000'),
  ('ダイソン', 'vacuum', 'V7 Absolute'),
  ('シャープ', 'vacuum', 'EC-KH9X'),
  ('Panasonic', 'vacuum', 'MC-SB33J'),
  ('シャープ', 'washing_machine', 'ES-GE55R'),
  ('シャープ', 'washing_machine', 'ES-GE6B'),
  ('シャープ', 'washing_machine', 'ES-GE6D'),
  ('シャープ', 'washing_machine', 'ES-PH8C'),
  ('シャープ', 'washing_machine', 'ES-SH7C'),
  ('シャープ', 'washing_machine', 'ES-TX550'),
  ('シャープ', 'washing_machine', 'ES-TX5A'),
  ('シャープ', 'washing_machine', 'ES-TX5B'),
  ('シャープ', 'washing_machine', 'ES-TX5C'),
  ('シャープ', 'washing_machine', 'ES-TX5D'),
  ('シャープ', 'washing_machine', 'ES-TX8E'),
  ('Panasonic', 'washing_machine', 'NA-F60PB10'),
  ('Panasonic', 'washing_machine', 'NA-F60PB11'),
  ('Panasonic', 'washing_machine', 'NA-F60PB13'),
  ('Panasonic', 'washing_machine', 'NA-F70BE5'),
  ('Panasonic', 'washing_machine', 'NA-F70PB13'),
  ('Panasonic', 'washing_machine', 'NA-F7AE3'),
  ('Panasonic', 'washing_machine', 'NA-F7AE4'),
  ('Panasonic', 'washing_machine', 'NA-F7AE5'),
  ('Panasonic', 'washing_machine', 'NA-F7AE6'),
  ('Panasonic', 'washing_machine', 'NA-F8AE3'),
  ('Panasonic', 'washing_machine', 'NA-F8AE4'),
  ('Panasonic', 'washing_machine', 'NA-F8AE5'),
  ('Panasonic', 'washing_machine', 'NA-F8AE6'),
  ('Panasonic', 'washing_machine', 'NA-F9AE3'),
  ('Panasonic', 'washing_machine', 'NA-F9AE4'),
  ('Panasonic', 'washing_machine', 'NA-F9AE5'),
  ('Panasonic', 'washing_machine', 'NA-F9AE6'),
  ('Panasonic', 'washing_machine', 'NA-FA70H5'),
  ('Panasonic', 'washing_machine', 'NA-FA70H6'),
  ('三菱電機', 'refrigerator', 'MR-WX53Y'),
  ('三菱電機', 'refrigerator', 'MR-E57S'),
  ('Panasonic', 'refrigerator', 'NR-F477TM'),
  ('Panasonic', 'refrigerator', 'NR-F518XG'),
  ('三菱電機', 'refrigerator', 'MR-WX47C'),
  ('三菱電機', 'refrigerator', 'MR-WX47D'),
  ('三菱電機', 'refrigerator', 'MR-WX52A'),
  ('三菱電機', 'refrigerator', 'MR-WX52C'),
  ('三菱電機', 'refrigerator', 'MR-WX52D'),
  ('三菱電機', 'refrigerator', 'MR-WX60C'),
  ('三菱電機', 'refrigerator', 'MR-WX60D'),
  ('Panasonic', 'refrigerator', 'NR-F476TM'),
  ('Panasonic', 'refrigerator', 'NR-F556T'),
  ('三菱電機', 'refrigerator', 'MR-WX47A'),
  ('Panasonic', 'refrigerator', 'NR-F606T'),
  ('三菱電機', 'refrigerator', 'MR-MX50E'),
  ('三菱電機', 'refrigerator', 'MR-MX57E'),
  ('Panasonic', 'refrigerator', 'NR-F618XG'),
  ('三菱電機', 'refrigerator', 'MR-E62S'),
  ('三菱電機', 'refrigerator', 'MR-BX53X'),
  ('三菱電機', 'refrigerator', 'MR-R47Z'),
  ('Panasonic', 'refrigerator', 'NR-F505T'),
  ('Panasonic', 'refrigerator', 'NR-F506T'),
  ('Panasonic', 'refrigerator', 'NR-F507T'),
  ('Panasonic', 'refrigerator', 'NR-F557T'),
  ('日立', 'refrigerator', 'R-B6200'),
  ('三菱電機', 'refrigerator', 'MR-MX46E'),
  ('日立', 'refrigerator', 'R-B5200'),
  ('日立', 'refrigerator', 'R-B5700'),
  ('日立', 'refrigerator', 'R-C6700'),
  ('Panasonic', 'air_conditioner', 'CS-XS229C'),
  ('Panasonic', 'air_conditioner', 'CS-XS289C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS369C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS289C'),
  ('Panasonic', 'air_conditioner', 'CS-XS409C'),
  ('Panasonic', 'air_conditioner', 'CS-XS719C2'),
  ('日立', 'air_conditioner', 'RAS-A22Z'),
  ('日立', 'air_conditioner', 'RAS-VL7125D'),
  ('日立', 'air_conditioner', 'RAS-VJ2226S'),
  ('Panasonic', 'air_conditioner', 'CS-XS569C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS409C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS809C2'),
  ('日立', 'air_conditioner', 'RAS-N28V'),
  ('日立', 'air_conditioner', 'RAS-MJ4026D'),
  ('Panasonic', 'air_conditioner', 'CS-X228C'),
  ('Panasonic', 'air_conditioner', 'CS-X228CZ'),
  ('Panasonic', 'air_conditioner', 'CS-X258C'),
  ('Panasonic', 'air_conditioner', 'CS-X258CZ'),
  ('Panasonic', 'air_conditioner', 'CS-X259C'),
  ('Panasonic', 'air_conditioner', 'CS-X288C'),
  ('Panasonic', 'air_conditioner', 'CS-XS259C'),
  ('Panasonic', 'air_conditioner', 'CS-XS369C'),
  ('Panasonic', 'air_conditioner', 'CS-XS909C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS639C2'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV2518'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV2818S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV4018S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV5618S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV6318S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW222'),
  ('Panasonic', 'air_conditioner', 'CS-X369C'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW252'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW282S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW282'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW362S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW362'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW402S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW562S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW632S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW712S'),
  ('象印', 'rice_cooker', 'NW-SB10'),
  ('Panasonic', 'rice_cooker', 'SR-PGA54'),
  ('Panasonic', 'rice_cooker', 'SR-PGB54'),
  ('日立', 'rice_cooker', 'RZ-YW3000M'),
  ('Panasonic', 'rice_cooker', 'SR-HX108'),
  ('Panasonic', 'rice_cooker', 'SR-HX109'),
  ('Panasonic', 'rice_cooker', 'SR-HX100'),
  ('Panasonic', 'rice_cooker', 'SR-SPX107'),
  ('Panasonic', 'rice_cooker', 'SR-SY105J'),
  ('Panasonic', 'rice_cooker', 'SR-SY106J'),
  ('Panasonic', 'rice_cooker', 'SR-CVSX180'),
  ('東芝', 'rice_cooker', 'RC-10VSN'),
  ('日立', 'rice_cooker', 'RZ-YV100M'),
  ('Panasonic', 'rice_cooker', 'SR-PGC54'),
  ('象印', 'rice_cooker', 'NW-NB10'),
  ('Panasonic', 'rice_cooker', 'SR-HX107'),
  ('Panasonic', 'rice_cooker', 'SR-HB109'),
  ('Panasonic', 'rice_cooker', 'SR-HB107'),
  ('Panasonic', 'rice_cooker', 'SR-HB104'),
  ('Panasonic', 'rice_cooker', 'SR-SPX187'),
  ('象印', 'rice_cooker', 'NW-QA10'),
  ('象印', 'rice_cooker', 'NW-UT07'),
  ('東芝', 'rice_cooker', 'RC-10VRL'),
  ('東芝', 'rice_cooker', 'RC-10VRM'),
  ('東芝', 'rice_cooker', 'RC-10VRN'),
  ('東芝', 'rice_cooker', 'RC-10VSL'),
  ('東芝', 'rice_cooker', 'RC-10VSM'),
  ('東芝', 'rice_cooker', 'RC-10VXN'),
  ('Panasonic', 'rice_cooker', 'SR-PB106'),
  ('Panasonic', 'rice_cooker', 'SR-PB107'),
  ('Panasonic', 'rice_cooker', 'SR-PB108'),
  ('Panasonic', 'rice_cooker', 'SR-PB109'),
  ('Panasonic', 'rice_cooker', 'SR-HB108'),
  ('Panasonic', 'rice_cooker', 'SR-HB100'),
  ('象印', 'rice_cooker', 'NW-NB18'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPB-R100W'),
  ('東芝', 'rice_cooker', 'RC-188VSS'),
  ('東芝', 'rice_cooker', 'RC-189VSS'),
  ('東芝', 'rice_cooker', 'RC-18VRL'),
  ('東芝', 'rice_cooker', 'RC-18VRM'),
  ('東芝', 'rice_cooker', 'RC-18VRN'),
  ('東芝', 'rice_cooker', 'RC-18VSL'),
  ('東芝', 'rice_cooker', 'RC-18VSM'),
  ('東芝', 'rice_cooker', 'RC-18VSN'),
  ('東芝', 'rice_cooker', 'RC-10VXM'),
  ('三菱電機', 'rice_cooker', 'NJ-BW10G'),
  ('三菱電機', 'rice_cooker', 'NJ-SV06R'),
  ('三菱電機', 'rice_cooker', 'NJ-VS10G'),
  ('Panasonic', 'rice_cooker', 'SR-PGB54P'),
  ('Panasonic', 'rice_cooker', 'SR-PGB54A'),
  ('Panasonic', 'rice_cooker', 'SR-PGA54A'),
  ('Panasonic', 'rice_cooker', 'SR-MPB100'),
  ('Panasonic', 'rice_cooker', 'SR-SPX186'),
  ('象印', 'rice_cooker', 'NW-CA10'),
  ('三菱電機', 'rice_cooker', 'NJ-AW108'),
  ('三菱電機', 'rice_cooker', 'NJ-SE06H'),
  ('日立', 'rice_cooker', 'RZ-WW3000M'),
  ('Panasonic', 'rice_cooker', 'SR-PW106'),
  ('Panasonic', 'rice_cooker', 'SR-PW107'),
  ('Panasonic', 'rice_cooker', 'SR-SPA106'),
  ('シャープ', 'microwave', 'AX-HC2'),
  ('東芝', 'microwave', 'ER-ND8'),
  ('東芝', 'microwave', 'ER-PD8'),
  ('日立', 'microwave', 'MRO-BK1000'),
  ('日立', 'microwave', 'MRO-GV200'),
  ('東芝', 'microwave', 'ER-G3'),
  ('Panasonic', 'microwave', 'NE-S410F'),
  ('日立', 'microwave', 'MRO-FA4'),
  ('日立', 'microwave', 'MRO-NBK5000'),
  ('東芝', 'microwave', 'ER-JD8'),
  ('東芝', 'microwave', 'ER-JD8A'),
  ('東芝', 'microwave', 'ER-LD8'),
  ('東芝', 'microwave', 'ER-KD8'),
  ('東芝', 'microwave', 'ER-MD8'),
  ('東芝', 'microwave', 'ER-RD8'),
  ('東芝', 'microwave', 'ER-RD8E'),
  ('東芝', 'microwave', 'ER-SD80'),
  ('東芝', 'microwave', 'ER-SD80E'),
  ('Panasonic', 'microwave', 'NE-EH224'),
  ('Panasonic', 'microwave', 'NE-BS657'),
  ('日立', 'microwave', 'MRO-FV100'),
  ('日立', 'microwave', 'MRO-MBK5000'),
  ('日立', 'microwave', 'MRO-MBK3000'),
  ('日立', 'microwave', 'MRO-LV100'),
  ('東芝', 'microwave', 'ER-JD7'),
  ('東芝', 'microwave', 'ER-JD7A'),
  ('東芝', 'microwave', 'ER-LD7'),
  ('東芝', 'microwave', 'ER-KD7'),
  ('東芝', 'microwave', 'ER-M6'),
  ('東芝', 'microwave', 'ER-MD7')
on conflict (manufacturer, model_number) do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('バッテリー V8 Absolute', 'battery', 'oem', 'ダイソン'),
  ('バッテリー EC-AP500', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AR2S', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AS500', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AS510', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AS710', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SX210', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SX310', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SX320', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SX520', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-PR10', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SR11', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AR3S', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-FR5', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AH2R', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AH5', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-FR10', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-KR2', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AR11', 'battery', 'oem', 'シャープ'),
  ('バッテリー PV-BL50J', 'battery', 'oem', '日立'),
  ('バッテリー PV-BEH800', 'battery', 'oem', '日立'),
  ('バッテリー PV-BFH500', 'battery', 'oem', '日立'),
  ('バッテリー EC-AR7', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SR3S', 'battery', 'oem', 'シャープ'),
  ('バッテリー PV-BH500G', 'battery', 'oem', '日立'),
  ('バッテリー PV-BH900G', 'battery', 'oem', '日立'),
  ('バッテリー PV-BT5000', 'battery', 'oem', '日立'),
  ('バッテリー V7 Absolute', 'battery', 'oem', 'ダイソン'),
  ('バッテリー EC-KH9X', 'battery', 'oem', 'シャープ'),
  ('バッテリー MC-SB33J', 'battery', 'oem', 'Panasonic'),
  ('糸くずフィルター ES-GE55R', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE6B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE6D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PH8C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-SH7C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX550', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX5A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX5B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX5C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX5D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F60PB10', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60PB11', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60PB13', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F70BE5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F70PB13', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F7AE3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F7AE4', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F7AE5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F7AE6', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F8AE3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F8AE4', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F8AE5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F8AE6', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AE3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AE4', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AE5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AE6', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA70H5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA70H6', 'filter', 'oem', 'Panasonic'),
  ('製氷皿 MR-WX53Y', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-E57S', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 NR-F477TM', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F518XG', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 MR-WX47C', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX47D', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX52A', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX52C', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX52D', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX60C', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX60D', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 NR-F476TM', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F556T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 MR-WX47A', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 NR-F606T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 MR-MX50E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX57E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 NR-F618XG', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 MR-E62S', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-BX53X', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R47Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 NR-F505T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F506T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F507T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F557T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 R-B6200', 'ice_tray', 'oem', '日立'),
  ('製氷皿 MR-MX46E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 R-B5200', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-B5700', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-C6700', 'ice_tray', 'oem', '日立'),
  ('フィルター CS-XS229C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS289C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS369C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS289C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS409C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS719C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター RAS-A22Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-VL7125D', 'filter', 'oem', '日立'),
  ('フィルター RAS-VJ2226S', 'filter', 'oem', '日立'),
  ('フィルター CS-XS569C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS409C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS809C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター RAS-N28V', 'filter', 'oem', '日立'),
  ('フィルター RAS-MJ4026D', 'filter', 'oem', '日立'),
  ('フィルター CS-X228C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X228CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X258C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X258CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X259C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X288C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS259C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS369C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS909C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS639C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター MSZ-HXV2518', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV2818S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV4018S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV5618S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV6318S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW222', 'filter', 'oem', '三菱電機'),
  ('フィルター CS-X369C', 'filter', 'oem', 'Panasonic'),
  ('フィルター MSZ-ZW252', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW282S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW282', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW362S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW362', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW402S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW562S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW632S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW712S', 'filter', 'oem', '三菱電機'),
  ('内釜 NW-SB10', 'inner_pot', 'oem', '象印'),
  ('内釜 SR-PGA54', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PGB54', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 RZ-YW3000M', 'inner_pot', 'oem', '日立'),
  ('内釜 SR-HX108', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-HX109', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-HX100', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SPX107', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SY105J', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SY106J', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-CVSX180', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 RC-10VSN', 'inner_pot', 'oem', '東芝'),
  ('内釜 RZ-YV100M', 'inner_pot', 'oem', '日立'),
  ('内釜 SR-PGC54', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 NW-NB10', 'inner_pot', 'oem', '象印'),
  ('内釜 SR-HX107', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-HB109', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-HB107', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-HB104', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SPX187', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 NW-QA10', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-UT07', 'inner_pot', 'oem', '象印'),
  ('内釜 RC-10VRL', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VRM', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VRN', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VSL', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VSM', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VXN', 'inner_pot', 'oem', '東芝'),
  ('内釜 SR-PB106', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PB107', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PB108', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PB109', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-HB108', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-HB100', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 NW-NB18', 'inner_pot', 'oem', '象印'),
  ('内釜 JPB-R100W', 'inner_pot', 'oem', 'タイガー魔法瓶'),
  ('内釜 RC-188VSS', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-189VSS', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-18VRL', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-18VRM', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-18VRN', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-18VSL', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-18VSM', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-18VSN', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VXM', 'inner_pot', 'oem', '東芝'),
  ('内釜 NJ-BW10G', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-SV06R', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-VS10G', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 SR-PGB54P', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PGB54A', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PGA54A', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-MPB100', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SPX186', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 NW-CA10', 'inner_pot', 'oem', '象印'),
  ('内釜 NJ-AW108', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-SE06H', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 RZ-WW3000M', 'inner_pot', 'oem', '日立'),
  ('内釜 SR-PW106', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PW107', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SPA106', 'inner_pot', 'oem', 'Panasonic'),
  ('ターンテーブル AX-HC2', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル ER-ND8', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-PD8', 'turntable', 'oem', '東芝'),
  ('ターンテーブル MRO-BK1000', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-GV200', 'turntable', 'oem', '日立'),
  ('ターンテーブル ER-G3', 'turntable', 'oem', '東芝'),
  ('ターンテーブル NE-S410F', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル MRO-FA4', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-NBK5000', 'turntable', 'oem', '日立'),
  ('ターンテーブル ER-JD8', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JD8A', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-LD8', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-KD8', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-MD8', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-RD8', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-RD8E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-SD80', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-SD80E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル NE-EH224', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS657', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル MRO-FV100', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-MBK5000', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-MBK3000', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-LV100', 'turntable', 'oem', '日立'),
  ('ターンテーブル ER-JD7', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JD7A', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-LD7', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-KD7', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-M6', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-MD7', 'turntable', 'oem', '東芝')
on conflict do nothing;

insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id, null
from parts p
join appliances a on p.name like '%' || a.model_number
where a.model_number in ('V8 Absolute', 'EC-AP500', 'EC-AR2S', 'EC-AS500', 'EC-AS510', 'EC-AS710', 'EC-SX210', 'EC-SX310', 'EC-SX320', 'EC-SX520', 'EC-PR10', 'EC-SR11', 'EC-AR3S', 'EC-FR5', 'EC-AH2R', 'EC-AH5', 'EC-FR10', 'EC-KR2', 'EC-AR11', 'PV-BL50J', 'PV-BEH800', 'PV-BFH500', 'EC-AR7', 'EC-SR3S', 'PV-BH500G', 'PV-BH900G', 'PV-BT5000', 'V7 Absolute', 'EC-KH9X', 'MC-SB33J', 'ES-GE55R', 'ES-GE6B', 'ES-GE6D', 'ES-PH8C', 'ES-SH7C', 'ES-TX550', 'ES-TX5A', 'ES-TX5B', 'ES-TX5C', 'ES-TX5D', 'ES-TX8E', 'NA-F60PB10', 'NA-F60PB11', 'NA-F60PB13', 'NA-F70BE5', 'NA-F70PB13', 'NA-F7AE3', 'NA-F7AE4', 'NA-F7AE5', 'NA-F7AE6', 'NA-F8AE3', 'NA-F8AE4', 'NA-F8AE5', 'NA-F8AE6', 'NA-F9AE3', 'NA-F9AE4', 'NA-F9AE5', 'NA-F9AE6', 'NA-FA70H5', 'NA-FA70H6', 'MR-WX53Y', 'MR-E57S', 'NR-F477TM', 'NR-F518XG', 'MR-WX47C', 'MR-WX47D', 'MR-WX52A', 'MR-WX52C', 'MR-WX52D', 'MR-WX60C', 'MR-WX60D', 'NR-F476TM', 'NR-F556T', 'MR-WX47A', 'NR-F606T', 'MR-MX50E', 'MR-MX57E', 'NR-F618XG', 'MR-E62S', 'MR-BX53X', 'MR-R47Z', 'NR-F505T', 'NR-F506T', 'NR-F507T', 'NR-F557T', 'R-B6200', 'MR-MX46E', 'R-B5200', 'R-B5700', 'R-C6700', 'CS-XS229C', 'CS-XS289C2', 'CS-XS369C2', 'CS-XS289C', 'CS-XS409C', 'CS-XS719C2', 'RAS-A22Z', 'RAS-VL7125D', 'RAS-VJ2226S', 'CS-XS569C2', 'CS-XS409C2', 'CS-XS809C2', 'RAS-N28V', 'RAS-MJ4026D', 'CS-X228C', 'CS-X228CZ', 'CS-X258C', 'CS-X258CZ', 'CS-X259C', 'CS-X288C', 'CS-XS259C', 'CS-XS369C', 'CS-XS909C2', 'CS-XS639C2', 'MSZ-HXV2518', 'MSZ-HXV2818S', 'MSZ-HXV4018S', 'MSZ-HXV5618S', 'MSZ-HXV6318S', 'MSZ-ZW222', 'CS-X369C', 'MSZ-ZW252', 'MSZ-ZW282S', 'MSZ-ZW282', 'MSZ-ZW362S', 'MSZ-ZW362', 'MSZ-ZW402S', 'MSZ-ZW562S', 'MSZ-ZW632S', 'MSZ-ZW712S', 'NW-SB10', 'SR-PGA54', 'SR-PGB54', 'RZ-YW3000M', 'SR-HX108', 'SR-HX109', 'SR-HX100', 'SR-SPX107', 'SR-SY105J', 'SR-SY106J', 'SR-CVSX180', 'RC-10VSN', 'RZ-YV100M', 'SR-PGC54', 'NW-NB10', 'SR-HX107', 'SR-HB109', 'SR-HB107', 'SR-HB104', 'SR-SPX187', 'NW-QA10', 'NW-UT07', 'RC-10VRL', 'RC-10VRM', 'RC-10VRN', 'RC-10VSL', 'RC-10VSM', 'RC-10VXN', 'SR-PB106', 'SR-PB107', 'SR-PB108', 'SR-PB109', 'SR-HB108', 'SR-HB100', 'NW-NB18', 'JPB-R100W', 'RC-188VSS', 'RC-189VSS', 'RC-18VRL', 'RC-18VRM', 'RC-18VRN', 'RC-18VSL', 'RC-18VSM', 'RC-18VSN', 'RC-10VXM', 'NJ-BW10G', 'NJ-SV06R', 'NJ-VS10G', 'SR-PGB54P', 'SR-PGB54A', 'SR-PGA54A', 'SR-MPB100', 'SR-SPX186', 'NW-CA10', 'NJ-AW108', 'NJ-SE06H', 'RZ-WW3000M', 'SR-PW106', 'SR-PW107', 'SR-SPA106', 'AX-HC2', 'ER-ND8', 'ER-PD8', 'MRO-BK1000', 'MRO-GV200', 'ER-G3', 'NE-S410F', 'MRO-FA4', 'MRO-NBK5000', 'ER-JD8', 'ER-JD8A', 'ER-LD8', 'ER-KD8', 'ER-MD8', 'ER-RD8', 'ER-RD8E', 'ER-SD80', 'ER-SD80E', 'NE-EH224', 'NE-BS657', 'MRO-FV100', 'MRO-MBK5000', 'MRO-MBK3000', 'MRO-LV100', 'ER-JD7', 'ER-JD7A', 'ER-LD7', 'ER-KD7', 'ER-M6', 'ER-MD7')
and not exists (
  select 1 from appliance_parts ap where ap.appliance_id = a.id and ap.part_id = p.id
);
-- ============================================================
-- discover-appliances.ts 由来 v3 (max expansion)
-- occurrences >= 4 のすべての実モデルをカテゴリ別配分で投入
-- ============================================================
insert into appliances (manufacturer, category, model_number) values
  ('シャープ', 'washing_machine', 'ES-LP2'),
  ('シャープ', 'washing_machine', 'ES-LP1'),
  ('シャープ', 'washing_machine', 'ES-PX8C'),
  ('シャープ', 'washing_machine', 'ES-PX8D'),
  ('シャープ', 'washing_machine', 'ES-TX840'),
  ('シャープ', 'washing_machine', 'ES-GX850'),
  ('シャープ', 'washing_machine', 'ES-GX8A'),
  ('シャープ', 'washing_machine', 'ES-PX8B'),
  ('シャープ', 'washing_machine', 'ES-TX830'),
  ('Panasonic', 'washing_machine', 'NA-FA120V1'),
  ('Panasonic', 'washing_machine', 'NA-FA70H2'),
  ('Panasonic', 'washing_machine', 'NA-FA70H3'),
  ('Panasonic', 'washing_machine', 'NA-FA80H2'),
  ('Panasonic', 'washing_machine', 'NA-FA80H3'),
  ('Panasonic', 'washing_machine', 'NA-FA80H5'),
  ('Panasonic', 'washing_machine', 'NA-FA80H6'),
  ('Panasonic', 'washing_machine', 'NA-FA90H6'),
  ('Panasonic', 'washing_machine', 'NA-FA90H5'),
  ('Panasonic', 'washing_machine', 'NA-FA100H7'),
  ('Panasonic', 'washing_machine', 'NA-FA80H7'),
  ('Panasonic', 'washing_machine', 'NA-FA90H7'),
  ('Panasonic', 'washing_machine', 'NA-FA120V2'),
  ('Panasonic', 'washing_machine', 'NA-FA100H9'),
  ('Panasonic', 'washing_machine', 'NA-FA10K1'),
  ('Panasonic', 'washing_machine', 'NA-FA80H9'),
  ('Panasonic', 'washing_machine', 'NA-FA90H9'),
  ('Panasonic', 'washing_machine', 'NA-FA100H8'),
  ('Panasonic', 'washing_machine', 'NA-FA80H8'),
  ('Panasonic', 'washing_machine', 'NA-FW100K9'),
  ('シャープ', 'washing_machine', 'ES-GE7A'),
  ('シャープ', 'washing_machine', 'ES-TX74'),
  ('日立', 'washing_machine', 'BW-D10WV'),
  ('日立', 'washing_machine', 'BW-D10XTV'),
  ('シャープ', 'washing_machine', 'ES-GE60P'),
  ('シャープ', 'washing_machine', 'ES-GE70R'),
  ('シャープ', 'washing_machine', 'ES-GE7B'),
  ('シャープ', 'washing_machine', 'ES-GE7C'),
  ('シャープ', 'washing_machine', 'ES-GE7D'),
  ('シャープ', 'washing_machine', 'ES-PW10D'),
  ('Panasonic', 'washing_machine', 'NA-FW100K8'),
  ('Panasonic', 'washing_machine', 'NA-FA120V3'),
  ('Panasonic', 'washing_machine', 'NA-FA90H8'),
  ('シャープ', 'washing_machine', 'ES-GE60N'),
  ('シャープ', 'washing_machine', 'ES-GV8A'),
  ('シャープ', 'washing_machine', 'ES-GV9B'),
  ('シャープ', 'washing_machine', 'ES-GV9C'),
  ('シャープ', 'washing_machine', 'ES-KSV9C'),
  ('シャープ', 'washing_machine', 'ES-PT10C'),
  ('シャープ', 'washing_machine', 'ES-PT10D'),
  ('シャープ', 'washing_machine', 'ES-PU10C'),
  ('シャープ', 'washing_machine', 'ES-PU11B'),
  ('シャープ', 'washing_machine', 'ES-PU11C'),
  ('シャープ', 'washing_machine', 'ES-PW11D'),
  ('シャープ', 'washing_machine', 'ES-PW8D'),
  ('シャープ', 'washing_machine', 'ES-PX10A'),
  ('シャープ', 'washing_machine', 'ES-PX10B'),
  ('シャープ', 'washing_machine', 'ES-PX9B'),
  ('シャープ', 'washing_machine', 'ES-T707'),
  ('シャープ', 'washing_machine', 'ES-T708'),
  ('シャープ', 'washing_machine', 'ES-T711'),
  ('シャープ', 'washing_machine', 'ES-TX8A'),
  ('シャープ', 'washing_machine', 'ES-TX8B'),
  ('シャープ', 'washing_machine', 'ES-TX8C'),
  ('シャープ', 'washing_machine', 'ES-TX930'),
  ('シャープ', 'washing_machine', 'ES-TX940'),
  ('シャープ', 'washing_machine', 'ES-TX9A'),
  ('Panasonic', 'washing_machine', 'NA-F70PB15'),
  ('シャープ', 'washing_machine', 'ES-GE70N'),
  ('シャープ', 'washing_machine', 'ES-GE70P'),
  ('シャープ', 'washing_machine', 'ES-GV10B'),
  ('シャープ', 'washing_machine', 'ES-GV10C'),
  ('シャープ', 'washing_machine', 'ES-GV10D'),
  ('シャープ', 'washing_machine', 'ES-GV80R'),
  ('シャープ', 'washing_machine', 'ES-GV8B'),
  ('シャープ', 'washing_machine', 'ES-GV8C'),
  ('シャープ', 'washing_machine', 'ES-GV8D'),
  ('シャープ', 'washing_machine', 'ES-GV90R'),
  ('シャープ', 'washing_machine', 'ES-GV9A'),
  ('シャープ', 'washing_machine', 'ES-GV9D'),
  ('シャープ', 'washing_machine', 'ES-GW11D'),
  ('シャープ', 'washing_machine', 'ES-GX950'),
  ('シャープ', 'washing_machine', 'ES-GX9A'),
  ('シャープ', 'washing_machine', 'ES-KS70P'),
  ('シャープ', 'washing_machine', 'ES-KS70R'),
  ('シャープ', 'washing_machine', 'ES-KS70S'),
  ('シャープ', 'washing_machine', 'ES-KS70U'),
  ('シャープ', 'washing_machine', 'ES-T706'),
  ('シャープ', 'washing_machine', 'ES-TX8D'),
  ('シャープ', 'washing_machine', 'ES-GE55N'),
  ('シャープ', 'washing_machine', 'ES-KS70N'),
  ('シャープ', 'washing_machine', 'ES-KSV9B'),
  ('シャープ', 'washing_machine', 'ES-KSV9D'),
  ('シャープ', 'washing_machine', 'ES-T709'),
  ('シャープ', 'washing_machine', 'ES-T710'),
  ('シャープ', 'washing_machine', 'ES-TA840'),
  ('シャープ', 'washing_machine', 'ES-TX750'),
  ('シャープ', 'washing_machine', 'ES-TX850'),
  ('シャープ', 'washing_machine', 'ES-TX950'),
  ('シャープ', 'washing_machine', 'ES-TG74V'),
  ('Panasonic', 'washing_machine', 'NA-F60PB12'),
  ('三菱電機', 'refrigerator', 'MR-WX53Z'),
  ('三菱電機', 'refrigerator', 'MR-JX53Z'),
  ('三菱電機', 'refrigerator', 'MR-WX48Z'),
  ('三菱電機', 'refrigerator', 'MR-WX61Z'),
  ('三菱電機', 'refrigerator', 'MR-B46Z'),
  ('三菱電機', 'refrigerator', 'MR-JX61Z'),
  ('三菱電機', 'refrigerator', 'MR-WX70C'),
  ('三菱電機', 'refrigerator', 'MR-WX71Z'),
  ('三菱電機', 'refrigerator', 'MR-JX53X'),
  ('三菱電機', 'refrigerator', 'MR-JX52W'),
  ('三菱電機', 'refrigerator', 'MR-JX53Y'),
  ('東芝', 'refrigerator', 'GR-M15BS'),
  ('Panasonic', 'refrigerator', 'NR-F561XPV'),
  ('三菱電機', 'refrigerator', 'MR-JX60W'),
  ('三菱電機', 'refrigerator', 'MR-B46D'),
  ('三菱電機', 'refrigerator', 'MR-MB45E'),
  ('三菱電機', 'refrigerator', 'MR-MX57D'),
  ('三菱電機', 'refrigerator', 'MR-RX46A'),
  ('三菱電機', 'refrigerator', 'MR-WX61Y'),
  ('三菱電機', 'refrigerator', 'MR-WX71Y'),
  ('Panasonic', 'refrigerator', 'NR-E438T'),
  ('Panasonic', 'refrigerator', 'NR-F605T'),
  ('日立', 'refrigerator', 'R-B6700'),
  ('三菱電機', 'refrigerator', 'MR-JX64W'),
  ('三菱電機', 'refrigerator', 'MR-JX52A'),
  ('三菱電機', 'refrigerator', 'MR-JX60A'),
  ('三菱電機', 'refrigerator', 'MR-MX50D'),
  ('三菱電機', 'refrigerator', 'MR-JX61X'),
  ('三菱電機', 'refrigerator', 'MR-JX61Y'),
  ('東芝', 'refrigerator', 'GR-M17BS'),
  ('東芝', 'refrigerator', 'GR-P15BS'),
  ('東芝', 'refrigerator', 'GR-P17BS'),
  ('東芝', 'refrigerator', 'GR-R15BS'),
  ('東芝', 'refrigerator', 'GR-R17BS'),
  ('東芝', 'refrigerator', 'GR-S15BS'),
  ('東芝', 'refrigerator', 'GR-S17BS'),
  ('東芝', 'refrigerator', 'GR-T15BS'),
  ('東芝', 'refrigerator', 'GR-T17BS'),
  ('東芝', 'refrigerator', 'GR-U15BS'),
  ('東芝', 'refrigerator', 'GR-U17BS'),
  ('東芝', 'refrigerator', 'GR-V15BS'),
  ('東芝', 'refrigerator', 'GR-V17BS'),
  ('Panasonic', 'refrigerator', 'NR-E434T'),
  ('Panasonic', 'refrigerator', 'NR-F506XV'),
  ('東芝', 'refrigerator', 'GR-G51FXV'),
  ('東芝', 'refrigerator', 'GR-P510FD'),
  ('Panasonic', 'refrigerator', 'NR-E434TL'),
  ('Panasonic', 'refrigerator', 'NR-E435T'),
  ('Panasonic', 'refrigerator', 'NR-E435TL'),
  ('Panasonic', 'refrigerator', 'NR-E473TL'),
  ('Panasonic', 'refrigerator', 'NR-F433T'),
  ('Panasonic', 'refrigerator', 'NR-F434T'),
  ('Panasonic', 'refrigerator', 'NR-F436T'),
  ('Panasonic', 'refrigerator', 'NR-F505XV'),
  ('Panasonic', 'refrigerator', 'NR-F618TV'),
  ('Panasonic', 'refrigerator', 'NR-F555XV'),
  ('Panasonic', 'refrigerator', 'NR-E437T'),
  ('Panasonic', 'refrigerator', 'NR-B253T'),
  ('三菱電機', 'refrigerator', 'MR-RX52T'),
  ('Panasonic', 'refrigerator', 'NR-E474T'),
  ('Panasonic', 'refrigerator', 'NR-F438T'),
  ('Panasonic', 'refrigerator', 'NR-F557XV'),
  ('三菱電機', 'refrigerator', 'MR-RX47T'),
  ('三菱電機', 'refrigerator', 'MR-RX62T'),
  ('三菱電機', 'refrigerator', 'MR-JX52C'),
  ('三菱電機', 'refrigerator', 'MR-JX60C'),
  ('三菱電機', 'refrigerator', 'MR-MX50F'),
  ('三菱電機', 'refrigerator', 'MR-RX46C'),
  ('三菱電機', 'refrigerator', 'MR-WX70A'),
  ('三菱電機', 'refrigerator', 'MR-E47S'),
  ('Panasonic', 'refrigerator', 'NR-F507XV'),
  ('Panasonic', 'refrigerator', 'NR-E474TL'),
  ('Panasonic', 'refrigerator', 'NR-F501XV'),
  ('Panasonic', 'refrigerator', 'NR-F601XV'),
  ('Panasonic', 'refrigerator', 'NR-F604T'),
  ('Panasonic', 'refrigerator', 'NR-F606XV'),
  ('Panasonic', 'refrigerator', 'NR-F603T'),
  ('Panasonic', 'refrigerator', 'NR-F605XV'),
  ('Panasonic', 'refrigerator', 'NR-E436T'),
  ('Panasonic', 'refrigerator', 'NR-F475XPV'),
  ('Panasonic', 'refrigerator', 'NR-F476XPV'),
  ('Panasonic', 'refrigerator', 'NR-F486MEX'),
  ('Panasonic', 'refrigerator', 'NR-F552XPV'),
  ('日立', 'refrigerator', 'R-A5700'),
  ('日立', 'refrigerator', 'R-A6200'),
  ('三菱電機', 'refrigerator', 'MR-RX57T'),
  ('三菱電機', 'refrigerator', 'MR-B46F'),
  ('三菱電機', 'refrigerator', 'MR-MX46H'),
  ('三菱電機', 'refrigerator', 'MR-MX50H'),
  ('三菱電機', 'refrigerator', 'MR-WX47H'),
  ('三菱電機', 'refrigerator', 'MR-WX60A'),
  ('三菱電機', 'refrigerator', 'MR-E52S'),
  ('三菱電機', 'refrigerator', 'MR-R47Y'),
  ('Panasonic', 'refrigerator', 'NR-F500T'),
  ('Panasonic', 'refrigerator', 'NR-E450TL'),
  ('Panasonic', 'refrigerator', 'NR-E415PV'),
  ('Panasonic', 'refrigerator', 'NR-E415PVL'),
  ('Panasonic', 'refrigerator', 'NR-F504HPX'),
  ('Panasonic', 'refrigerator', 'NR-F505HPX'),
  ('Panasonic', 'refrigerator', 'NR-F506XPV'),
  ('シャープ', 'vacuum', 'EC-SR10'),
  ('ダイソン', 'vacuum', 'V8 Absolute'),
  ('日立', 'vacuum', 'PV-BEH900'),
  ('シャープ', 'vacuum', 'EC-AR8'),
  ('シャープ', 'vacuum', 'EC-HR7'),
  ('シャープ', 'vacuum', 'EC-HR8'),
  ('シャープ', 'vacuum', 'EC-SR7'),
  ('シャープ', 'vacuum', 'EC-SR8'),
  ('シャープ', 'vacuum', 'EC-SR9'),
  ('日立', 'vacuum', 'PV-BFL1'),
  ('シャープ', 'vacuum', 'EC-KR1'),
  ('シャープ', 'vacuum', 'EC-AR10'),
  ('シャープ', 'vacuum', 'EC-SX200'),
  ('シャープ', 'vacuum', 'EC-FR9'),
  ('シャープ', 'vacuum', 'EC-PR9'),
  ('シャープ', 'vacuum', 'EC-A1R'),
  ('シャープ', 'vacuum', 'EC-SX530'),
  ('シャープ', 'vacuum', 'EC-AR5'),
  ('シャープ', 'vacuum', 'EC-AR9'),
  ('シャープ', 'vacuum', 'EC-SR5'),
  ('シャープ', 'vacuum', 'EC-AR5X'),
  ('シャープ', 'vacuum', 'EC-FR7'),
  ('日立', 'vacuum', 'PV-BH900H'),
  ('ダイソン', 'vacuum', 'V7 Absolute'),
  ('Panasonic', 'vacuum', 'MC-SB34J'),
  ('日立', 'vacuum', 'PV-BL30H'),
  ('日立', 'vacuum', 'PV-BL10G'),
  ('シャープ', 'vacuum', 'EC-AP700'),
  ('シャープ', 'vacuum', 'EC-AS700'),
  ('Panasonic', 'vacuum', 'MC-SB53K'),
  ('Panasonic', 'vacuum', 'MC-PB60J'),
  ('Panasonic', 'vacuum', 'MC-SB54K'),
  ('日立', 'vacuum', 'PV-BL30K'),
  ('日立', 'vacuum', 'PV-BL50K'),
  ('日立', 'vacuum', 'PV-BHL1000J'),
  ('日立', 'vacuum', 'PV-BHL2000J'),
  ('日立', 'vacuum', 'PV-BHL3000J'),
  ('日立', 'vacuum', 'PV-BKL11G'),
  ('日立', 'vacuum', 'PV-BL1H'),
  ('日立', 'vacuum', 'PV-BL20G'),
  ('日立', 'vacuum', 'PV-BL3J'),
  ('ダイソン', 'vacuum', 'V8 Slim'),
  ('日立', 'vacuum', 'PV-BL30L'),
  ('日立', 'vacuum', 'PV-BL50L'),
  ('日立', 'vacuum', 'PV-BL50M'),
  ('日立', 'vacuum', 'PV-BL2H'),
  ('日立', 'vacuum', 'PV-BH500H'),
  ('シャープ', 'vacuum', 'EC-FR11'),
  ('日立', 'vacuum', 'PV-BEH900009'),
  ('日立', 'vacuum', 'PV-BH900J'),
  ('ダイソン', 'vacuum', 'V6 Absolute'),
  ('シャープ', 'vacuum', 'EC-KH7X'),
  ('日立', 'vacuum', 'PV-BL50G'),
  ('日立', 'vacuum', 'PV-BL50P'),
  ('日立', 'vacuum', 'PV-BH900K'),
  ('日立', 'vacuum', 'PV-BFL1008'),
  ('シャープ', 'vacuum', 'EC-KR3'),
  ('日立', 'vacuum', 'PV-BL3L'),
  ('日立', 'vacuum', 'PV-BKL11L'),
  ('三菱電機', 'rice_cooker', 'NJ-BW10H'),
  ('Panasonic', 'rice_cooker', 'SR-SPA107'),
  ('Panasonic', 'rice_cooker', 'SR-PA107'),
  ('Panasonic', 'rice_cooker', 'SR-PA108'),
  ('Panasonic', 'rice_cooker', 'SR-PA106'),
  ('Panasonic', 'rice_cooker', 'SR-PA109'),
  ('Panasonic', 'rice_cooker', 'SR-SPA108'),
  ('Panasonic', 'rice_cooker', 'SR-PW108'),
  ('Panasonic', 'rice_cooker', 'SR-PW188'),
  ('Panasonic', 'rice_cooker', 'SR-SPA188'),
  ('Panasonic', 'rice_cooker', 'SR-VSX180'),
  ('Panasonic', 'rice_cooker', 'SR-VSX181'),
  ('Panasonic', 'rice_cooker', 'SR-VSX188'),
  ('Panasonic', 'rice_cooker', 'SR-VSX189'),
  ('Panasonic', 'rice_cooker', 'SR-HX185'),
  ('Panasonic', 'rice_cooker', 'SR-HX186'),
  ('象印', 'rice_cooker', 'NW-YA10'),
  ('象印', 'rice_cooker', 'NW-VA10'),
  ('象印', 'rice_cooker', 'NP-VD10'),
  ('象印', 'rice_cooker', 'NW-PS10'),
  ('象印', 'rice_cooker', 'NW-PT10'),
  ('象印', 'rice_cooker', 'NW-QA18'),
  ('東芝', 'rice_cooker', 'RC-108VSS'),
  ('東芝', 'rice_cooker', 'RC-109VSS'),
  ('東芝', 'rice_cooker', 'RC-10VRP'),
  ('東芝', 'rice_cooker', 'RC-10VSP'),
  ('東芝', 'rice_cooker', 'RC-10VSR'),
  ('東芝', 'rice_cooker', 'RC-10VRR'),
  ('三菱電機', 'rice_cooker', 'NJ-VW109'),
  ('三菱電機', 'rice_cooker', 'NJ-SW065'),
  ('三菱電機', 'rice_cooker', 'NJ-SW066'),
  ('三菱電機', 'rice_cooker', 'NJ-SW067'),
  ('三菱電機', 'rice_cooker', 'NJ-SW069'),
  ('日立', 'rice_cooker', 'RZ-WG10M'),
  ('日立', 'rice_cooker', 'RZ-TS180M'),
  ('Panasonic', 'rice_cooker', 'SR-PGC54A'),
  ('象印', 'rice_cooker', 'NP-VI10'),
  ('象印', 'rice_cooker', 'NP-VL10'),
  ('象印', 'rice_cooker', 'NP-VN10'),
  ('象印', 'rice_cooker', 'NP-VZ10'),
  ('象印', 'rice_cooker', 'NP-HQ10'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPB1865'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPB-R180W'),
  ('東芝', 'rice_cooker', 'RC-6XJ'),
  ('東芝', 'rice_cooker', 'RC-6XK'),
  ('東芝', 'rice_cooker', 'RC-6XL'),
  ('東芝', 'rice_cooker', 'RC-6XM'),
  ('三菱電機', 'rice_cooker', 'NJ-SW068'),
  ('三菱電機', 'rice_cooker', 'NJ-VW107'),
  ('三菱電機', 'rice_cooker', 'NJ-SWB06'),
  ('三菱電機', 'rice_cooker', 'NJ-VP10H'),
  ('日立', 'rice_cooker', 'RZ-WV100M'),
  ('日立', 'rice_cooker', 'RZ-BV100M'),
  ('日立', 'rice_cooker', 'RZ-FZ10J'),
  ('日立', 'rice_cooker', 'RZ-SD10KSJ'),
  ('日立', 'rice_cooker', 'RZ-TD10KSJ'),
  ('Panasonic', 'rice_cooker', 'SR-HBA101'),
  ('Panasonic', 'rice_cooker', 'SR-MPW101'),
  ('Panasonic', 'rice_cooker', 'SR-MPW102'),
  ('Panasonic', 'rice_cooker', 'SR-MPW100'),
  ('Panasonic', 'rice_cooker', 'SR-SA182'),
  ('Panasonic', 'rice_cooker', 'SR-SB182'),
  ('Panasonic', 'rice_cooker', 'SR-JX056'),
  ('象印', 'rice_cooker', 'NP-BG10'),
  ('象印', 'rice_cooker', 'NP-BH10'),
  ('象印', 'rice_cooker', 'NP-BJ10'),
  ('象印', 'rice_cooker', 'NW-VA18'),
  ('象印', 'rice_cooker', 'NP-VD18'),
  ('象印', 'rice_cooker', 'NW-FB18'),
  ('象印', 'rice_cooker', 'NW-FA10'),
  ('象印', 'rice_cooker', 'NW-FA18'),
  ('象印', 'rice_cooker', 'NW-WA18'),
  ('象印', 'rice_cooker', 'NP-RU05'),
  ('象印', 'rice_cooker', 'NP-RT05'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPC-B100K'),
  ('タイガー魔法瓶', 'rice_cooker', 'JPC-B100W'),
  ('東芝', 'rice_cooker', 'RC-18VQL'),
  ('東芝', 'rice_cooker', 'RC-18VQM'),
  ('東芝', 'rice_cooker', 'RC-10MSL'),
  ('三菱電機', 'rice_cooker', 'NJ-VW108'),
  ('三菱電機', 'rice_cooker', 'NJ-SWD06'),
  ('三菱電機', 'rice_cooker', 'NJ-VP18G'),
  ('日立', 'rice_cooker', 'RZ-SX100J'),
  ('日立', 'rice_cooker', 'RZ-XC10M'),
  ('日立', 'air_conditioner', 'RAS-VJ4026D'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV222'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV252'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV282S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV282'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV362S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV362'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV402S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV632S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV712S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV257'),
  ('Panasonic', 'air_conditioner', 'CS-X229C'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV2218'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV2518'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV2818'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV3618'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV4018S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV5618S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV251'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV252'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV281S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV282S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV401S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV402S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV561S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV562S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW221'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW251'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW281S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW281'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW361S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW361'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW401S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW561S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW711S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV221'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV251'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV281S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV281'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV361S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV361'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV401S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV561S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV631S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV711S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV2216'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV225'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV2516'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV255'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV2816S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV2816'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV285S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV285'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV3616S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV3616'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV365S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV365'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV4016S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV405S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV5616S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV565S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV6316S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV7116S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV227'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV287'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV367'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV407S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV507S'),
  ('Panasonic', 'air_conditioner', 'CS-XS400D2'),
  ('Panasonic', 'air_conditioner', 'CS-XS800D2'),
  ('Panasonic', 'air_conditioner', 'CS-XS360D'),
  ('Panasonic', 'air_conditioner', 'CS-XS258C'),
  ('Panasonic', 'air_conditioner', 'CS-XS288C2'),
  ('Panasonic', 'air_conditioner', 'CS-X718C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS408C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS808C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS368C'),
  ('Panasonic', 'air_conditioner', 'CS-X408C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS638C2'),
  ('Panasonic', 'air_conditioner', 'CS-X808C2'),
  ('Panasonic', 'air_conditioner', 'CS-X408C'),
  ('Panasonic', 'air_conditioner', 'CS-XS288C'),
  ('Panasonic', 'air_conditioner', 'CS-X288CZ'),
  ('Panasonic', 'air_conditioner', 'CS-X638C2'),
  ('Panasonic', 'air_conditioner', 'CS-X368C'),
  ('日立', 'air_conditioner', 'RAS-AJ22F'),
  ('日立', 'air_conditioner', 'RAS-MJ7126D'),
  ('Panasonic', 'air_conditioner', 'CS-X569C2'),
  ('Panasonic', 'air_conditioner', 'CS-X409C2'),
  ('Panasonic', 'air_conditioner', 'CS-X809C2'),
  ('日立', 'air_conditioner', 'RAS-VL6325D'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV5619S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV7118S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW631S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV562S'),
  ('Panasonic', 'air_conditioner', 'CS-XS400D'),
  ('Panasonic', 'air_conditioner', 'CS-XS710D2'),
  ('Panasonic', 'air_conditioner', 'CS-XS250D'),
  ('Panasonic', 'air_conditioner', 'CS-XS280D2'),
  ('日立', 'air_conditioner', 'RAS-VJ4025D'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV2516'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV2816S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV4016S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV5616S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV6316S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW714S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW227'),
  ('Panasonic', 'air_conditioner', 'CS-XS908C2'),
  ('Panasonic', 'air_conditioner', 'CS-X289C'),
  ('Panasonic', 'air_conditioner', 'CS-X908C2'),
  ('Panasonic', 'air_conditioner', 'CS-X909C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS228C'),
  ('Panasonic', 'air_conditioner', 'CS-XS368C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS568C2'),
  ('Panasonic', 'air_conditioner', 'CS-X639C2'),
  ('Panasonic', 'air_conditioner', 'CS-X719C2'),
  ('Panasonic', 'air_conditioner', 'CS-X568C2'),
  ('Panasonic', 'air_conditioner', 'CS-X409C'),
  ('Panasonic', 'air_conditioner', 'CS-XS718C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS408C'),
  ('東芝', 'microwave', 'ER-MD7'),
  ('東芝', 'microwave', 'ER-N6'),
  ('東芝', 'microwave', 'ER-N6E'),
  ('東芝', 'microwave', 'ER-ND7'),
  ('東芝', 'microwave', 'ER-P6'),
  ('東芝', 'microwave', 'ER-P6E'),
  ('東芝', 'microwave', 'ER-PD7'),
  ('東芝', 'microwave', 'ER-R6'),
  ('東芝', 'microwave', 'ER-R6E'),
  ('東芝', 'microwave', 'ER-RD7'),
  ('東芝', 'microwave', 'ER-S60'),
  ('東芝', 'microwave', 'ER-S60E'),
  ('東芝', 'microwave', 'ER-SD70'),
  ('東芝', 'microwave', 'ER-T60'),
  ('東芝', 'microwave', 'ER-TD70'),
  ('東芝', 'microwave', 'ER-TD80'),
  ('東芝', 'microwave', 'ER-TD80E'),
  ('東芝', 'microwave', 'ER-VD80'),
  ('東芝', 'microwave', 'ER-W60'),
  ('東芝', 'microwave', 'ER-W60E'),
  ('東芝', 'microwave', 'ER-V60'),
  ('東芝', 'microwave', 'ER-V60E'),
  ('東芝', 'microwave', 'ER-X60'),
  ('東芝', 'microwave', 'ER-XD80'),
  ('東芝', 'microwave', 'ER-ND300'),
  ('シャープ', 'microwave', 'AX-CX2'),
  ('シャープ', 'microwave', 'AX-CX3'),
  ('シャープ', 'microwave', 'AX-G1'),
  ('シャープ', 'microwave', 'AX-HC1'),
  ('シャープ', 'microwave', 'AX-M1'),
  ('シャープ', 'microwave', 'AX-MX1'),
  ('シャープ', 'microwave', 'AX-S1'),
  ('シャープ', 'microwave', 'AX-X1'),
  ('シャープ', 'microwave', 'AX-X2'),
  ('シャープ', 'microwave', 'AX-LSX3A'),
  ('シャープ', 'microwave', 'AX-XA30'),
  ('Panasonic', 'microwave', 'NE-M152'),
  ('Panasonic', 'microwave', 'NE-T152'),
  ('Panasonic', 'microwave', 'NE-T154'),
  ('Panasonic', 'microwave', 'NE-T155'),
  ('Panasonic', 'microwave', 'NE-S420F'),
  ('Panasonic', 'microwave', 'NE-EH227'),
  ('Panasonic', 'microwave', 'NE-TH227'),
  ('Panasonic', 'microwave', 'NE-BS656'),
  ('Panasonic', 'microwave', 'NE-BS808'),
  ('Panasonic', 'microwave', 'NE-BS1500'),
  ('日立', 'microwave', 'MRO-N550'),
  ('日立', 'microwave', 'MRO-CV200'),
  ('日立', 'microwave', 'MRO-GV300'),
  ('日立', 'microwave', 'MRO-JV300'),
  ('日立', 'microwave', 'MRO-CS8'),
  ('日立', 'microwave', 'MRO-RY3000'),
  ('日立', 'microwave', 'MRO-SBK1'),
  ('日立', 'microwave', 'MRO-SF6'),
  ('日立', 'microwave', 'MRO-SV3000'),
  ('東芝', 'microwave', 'ER-M6E'),
  ('東芝', 'microwave', 'ER-F3'),
  ('東芝', 'microwave', 'ER-GE54'),
  ('東芝', 'microwave', 'ER-H3'),
  ('東芝', 'microwave', 'ER-J3'),
  ('東芝', 'microwave', 'ER-J3A'),
  ('東芝', 'microwave', 'ER-K3'),
  ('東芝', 'microwave', 'ER-YJ3'),
  ('東芝', 'microwave', 'ER-YJ3A'),
  ('東芝', 'microwave', 'ER-YK3'),
  ('東芝', 'microwave', 'ER-H10'),
  ('東芝', 'microwave', 'ER-SD100'),
  ('東芝', 'microwave', 'ER-JD310'),
  ('東芝', 'microwave', 'ER-JD310A'),
  ('東芝', 'microwave', 'ER-JD410'),
  ('東芝', 'microwave', 'ER-JD410A'),
  ('東芝', 'microwave', 'ER-JD510'),
  ('東芝', 'microwave', 'ER-JD510A'),
  ('東芝', 'microwave', 'ER-KD320'),
  ('東芝', 'microwave', 'ER-KD420'),
  ('東芝', 'microwave', 'ER-KD520'),
  ('東芝', 'microwave', 'ER-LD330'),
  ('東芝', 'microwave', 'ER-LD430'),
  ('東芝', 'microwave', 'ER-LD530'),
  ('東芝', 'microwave', 'ER-WD3000'),
  ('シャープ', 'microwave', 'AX-GX2'),
  ('シャープ', 'microwave', 'AX-PX1'),
  ('シャープ', 'microwave', 'AX-PX2'),
  ('Panasonic', 'microwave', 'NE-EH2'),
  ('Panasonic', 'microwave', 'NE-EH22'),
  ('Panasonic', 'microwave', 'NE-EZ2'),
  ('Panasonic', 'microwave', 'NE-S200F'),
  ('Panasonic', 'microwave', 'NE-EH212'),
  ('Panasonic', 'microwave', 'NE-EH228'),
  ('Panasonic', 'microwave', 'NE-TH224'),
  ('Panasonic', 'microwave', 'NE-TH228'),
  ('Panasonic', 'microwave', 'NE-BS658'),
  ('Panasonic', 'microwave', 'NE-BS6A'),
  ('Panasonic', 'microwave', 'NE-BS655'),
  ('Panasonic', 'microwave', 'NE-BS9C'),
  ('Panasonic', 'microwave', 'NE-JBS652'),
  ('Panasonic', 'microwave', 'NE-JBS653'),
  ('Panasonic', 'microwave', 'NE-JBS654'),
  ('Panasonic', 'microwave', 'NE-SBS656'),
  ('Panasonic', 'microwave', 'NE-UBS10C')
on conflict (manufacturer, model_number) do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('糸くずフィルター ES-LP2', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-LP1', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PX8C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PX8D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX840', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GX850', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GX8A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PX8B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX830', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-FA120V1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA70H2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA70H3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA80H2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA80H3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA80H5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA80H6', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA90H6', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA90H5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA100H7', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA80H7', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA90H7', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA120V2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA100H9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA10K1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA80H9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA90H9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA100H8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA80H8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW100K9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター ES-GE7A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX74', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター BW-D10WV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D10XTV', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-GE60P', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE70R', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE7B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE7C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE7D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW10D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-FW100K8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA120V3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA90H8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター ES-GE60N', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV9B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV9C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KSV9C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PT10C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PT10D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PU10C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PU11B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PU11C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW11D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW8D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PX10A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PX10B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PX9B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T707', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T708', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T711', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX930', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX940', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX9A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F70PB15', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター ES-GE70N', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE70P', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV10B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV10C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV10D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV80R', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV90R', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV9A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV9D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GW11D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GX950', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GX9A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70P', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70R', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70U', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T706', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE55N', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70N', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KSV9B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KSV9D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T709', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T710', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TA840', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX750', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX850', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX950', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG74V', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F60PB12', 'filter', 'oem', 'Panasonic'),
  ('製氷皿 MR-WX53Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX53Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX48Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX61Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-B46Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX61Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX70C', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX71Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX53X', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX52W', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX53Y', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 GR-M15BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 NR-F561XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 MR-JX60W', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-B46D', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MB45E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX57D', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-RX46A', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX61Y', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX71Y', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 NR-E438T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F605T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 R-B6700', 'ice_tray', 'oem', '日立'),
  ('製氷皿 MR-JX64W', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX52A', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX60A', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX50D', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX61X', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX61Y', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 GR-M17BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P15BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P17BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R15BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R17BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-S15BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-S17BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-T15BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-T17BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-U15BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-U17BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-V15BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-V17BS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 NR-E434T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F506XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 GR-G51FXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P510FD', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 NR-E434TL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E435T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E435TL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E473TL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F433T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F434T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F436T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F505XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F618TV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F555XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E437T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-B253T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 MR-RX52T', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 NR-E474T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F438T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F557XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 MR-RX47T', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-RX62T', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX52C', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-JX60C', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX50F', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-RX46C', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX70A', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-E47S', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 NR-F507XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E474TL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F501XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F601XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F604T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F606XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F603T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F605XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E436T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F475XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F476XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F486MEX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F552XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 R-A5700', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-A6200', 'ice_tray', 'oem', '日立'),
  ('製氷皿 MR-RX57T', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-B46F', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX46H', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX50H', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX47H', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX60A', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-E52S', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R47Y', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 NR-F500T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E450TL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E415PV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E415PVL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F504HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F505HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F506XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('バッテリー EC-SR10', 'battery', 'oem', 'シャープ'),
  ('バッテリー V8 Absolute', 'battery', 'oem', 'ダイソン'),
  ('バッテリー PV-BEH900', 'battery', 'oem', '日立'),
  ('バッテリー EC-AR8', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-HR7', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-HR8', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SR7', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SR8', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SR9', 'battery', 'oem', 'シャープ'),
  ('バッテリー PV-BFL1', 'battery', 'oem', '日立'),
  ('バッテリー EC-KR1', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AR10', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SX200', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-FR9', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-PR9', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-A1R', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SX530', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AR5', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AR9', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-SR5', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AR5X', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-FR7', 'battery', 'oem', 'シャープ'),
  ('バッテリー PV-BH900H', 'battery', 'oem', '日立'),
  ('バッテリー V7 Absolute', 'battery', 'oem', 'ダイソン'),
  ('バッテリー MC-SB34J', 'battery', 'oem', 'Panasonic'),
  ('バッテリー PV-BL30H', 'battery', 'oem', '日立'),
  ('バッテリー PV-BL10G', 'battery', 'oem', '日立'),
  ('バッテリー EC-AP700', 'battery', 'oem', 'シャープ'),
  ('バッテリー EC-AS700', 'battery', 'oem', 'シャープ'),
  ('バッテリー MC-SB53K', 'battery', 'oem', 'Panasonic'),
  ('バッテリー MC-PB60J', 'battery', 'oem', 'Panasonic'),
  ('バッテリー MC-SB54K', 'battery', 'oem', 'Panasonic'),
  ('バッテリー PV-BL30K', 'battery', 'oem', '日立'),
  ('バッテリー PV-BL50K', 'battery', 'oem', '日立'),
  ('バッテリー PV-BHL1000J', 'battery', 'oem', '日立'),
  ('バッテリー PV-BHL2000J', 'battery', 'oem', '日立'),
  ('バッテリー PV-BHL3000J', 'battery', 'oem', '日立'),
  ('バッテリー PV-BKL11G', 'battery', 'oem', '日立'),
  ('バッテリー PV-BL1H', 'battery', 'oem', '日立'),
  ('バッテリー PV-BL20G', 'battery', 'oem', '日立'),
  ('バッテリー PV-BL3J', 'battery', 'oem', '日立'),
  ('バッテリー V8 Slim', 'battery', 'oem', 'ダイソン'),
  ('バッテリー PV-BL30L', 'battery', 'oem', '日立'),
  ('バッテリー PV-BL50L', 'battery', 'oem', '日立'),
  ('バッテリー PV-BL50M', 'battery', 'oem', '日立'),
  ('バッテリー PV-BL2H', 'battery', 'oem', '日立'),
  ('バッテリー PV-BH500H', 'battery', 'oem', '日立'),
  ('バッテリー EC-FR11', 'battery', 'oem', 'シャープ'),
  ('バッテリー PV-BEH900009', 'battery', 'oem', '日立'),
  ('バッテリー PV-BH900J', 'battery', 'oem', '日立'),
  ('バッテリー V6 Absolute', 'battery', 'oem', 'ダイソン'),
  ('バッテリー EC-KH7X', 'battery', 'oem', 'シャープ'),
  ('バッテリー PV-BL50G', 'battery', 'oem', '日立'),
  ('バッテリー PV-BL50P', 'battery', 'oem', '日立'),
  ('バッテリー PV-BH900K', 'battery', 'oem', '日立'),
  ('バッテリー PV-BFL1008', 'battery', 'oem', '日立'),
  ('バッテリー EC-KR3', 'battery', 'oem', 'シャープ'),
  ('バッテリー PV-BL3L', 'battery', 'oem', '日立'),
  ('バッテリー PV-BKL11L', 'battery', 'oem', '日立'),
  ('内釜 NJ-BW10H', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 SR-SPA107', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PA107', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PA108', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PA106', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PA109', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SPA108', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PW108', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-PW188', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SPA188', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-VSX180', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-VSX181', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-VSX188', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-VSX189', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-HX185', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-HX186', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 NW-YA10', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-VA10', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-VD10', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-PS10', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-PT10', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-QA18', 'inner_pot', 'oem', '象印'),
  ('内釜 RC-108VSS', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-109VSS', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VRP', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VSP', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VSR', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10VRR', 'inner_pot', 'oem', '東芝'),
  ('内釜 NJ-VW109', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-SW065', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-SW066', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-SW067', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-SW069', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 RZ-WG10M', 'inner_pot', 'oem', '日立'),
  ('内釜 RZ-TS180M', 'inner_pot', 'oem', '日立'),
  ('内釜 SR-PGC54A', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 NP-VI10', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-VL10', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-VN10', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-VZ10', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-HQ10', 'inner_pot', 'oem', '象印'),
  ('内釜 JPB1865', 'inner_pot', 'oem', 'タイガー魔法瓶'),
  ('内釜 JPB-R180W', 'inner_pot', 'oem', 'タイガー魔法瓶'),
  ('内釜 RC-6XJ', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-6XK', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-6XL', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-6XM', 'inner_pot', 'oem', '東芝'),
  ('内釜 NJ-SW068', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-VW107', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-SWB06', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-VP10H', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 RZ-WV100M', 'inner_pot', 'oem', '日立'),
  ('内釜 RZ-BV100M', 'inner_pot', 'oem', '日立'),
  ('内釜 RZ-FZ10J', 'inner_pot', 'oem', '日立'),
  ('内釜 RZ-SD10KSJ', 'inner_pot', 'oem', '日立'),
  ('内釜 RZ-TD10KSJ', 'inner_pot', 'oem', '日立'),
  ('内釜 SR-HBA101', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-MPW101', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-MPW102', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-MPW100', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SA182', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-SB182', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 SR-JX056', 'inner_pot', 'oem', 'Panasonic'),
  ('内釜 NP-BG10', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-BH10', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-BJ10', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-VA18', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-VD18', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-FB18', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-FA10', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-FA18', 'inner_pot', 'oem', '象印'),
  ('内釜 NW-WA18', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-RU05', 'inner_pot', 'oem', '象印'),
  ('内釜 NP-RT05', 'inner_pot', 'oem', '象印'),
  ('内釜 JPC-B100K', 'inner_pot', 'oem', 'タイガー魔法瓶'),
  ('内釜 JPC-B100W', 'inner_pot', 'oem', 'タイガー魔法瓶'),
  ('内釜 RC-18VQL', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-18VQM', 'inner_pot', 'oem', '東芝'),
  ('内釜 RC-10MSL', 'inner_pot', 'oem', '東芝'),
  ('内釜 NJ-VW108', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-SWD06', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 NJ-VP18G', 'inner_pot', 'oem', '三菱電機'),
  ('内釜 RZ-SX100J', 'inner_pot', 'oem', '日立'),
  ('内釜 RZ-XC10M', 'inner_pot', 'oem', '日立'),
  ('フィルター RAS-VJ4026D', 'filter', 'oem', '日立'),
  ('フィルター MSZ-ZXV222', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV252', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV282S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV282', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV362S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV362', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV402S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV632S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV712S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV257', 'filter', 'oem', '三菱電機'),
  ('フィルター CS-X229C', 'filter', 'oem', 'Panasonic'),
  ('フィルター MSZ-BXV2218', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV2518', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV2818', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV3618', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV4018S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV5618S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV251', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV252', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV281S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV282S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV401S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV402S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV561S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV562S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW221', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW251', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW281S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW281', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW361S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW361', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW401S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW561S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW711S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV221', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV251', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV281S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV281', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV361S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV361', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV401S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV561S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV631S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV711S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV2216', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV225', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV2516', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV255', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV2816S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV2816', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV285S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV285', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV3616S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV3616', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV365S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV365', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV4016S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV405S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV5616S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV565S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV6316S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV7116S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV227', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV287', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV367', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV407S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV507S', 'filter', 'oem', '三菱電機'),
  ('フィルター CS-XS400D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS800D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS360D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS258C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS288C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X718C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS408C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS808C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS368C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X408C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS638C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X808C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X408C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS288C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X288CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X638C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X368C', 'filter', 'oem', 'Panasonic'),
  ('フィルター RAS-AJ22F', 'filter', 'oem', '日立'),
  ('フィルター RAS-MJ7126D', 'filter', 'oem', '日立'),
  ('フィルター CS-X569C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X409C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X809C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター RAS-VL6325D', 'filter', 'oem', '日立'),
  ('フィルター MSZ-NXV5619S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV7118S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW631S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV562S', 'filter', 'oem', '三菱電機'),
  ('フィルター CS-XS400D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS710D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS250D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS280D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター RAS-VJ4025D', 'filter', 'oem', '日立'),
  ('フィルター MSZ-HXV2516', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV2816S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV4016S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV5616S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV6316S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW714S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW227', 'filter', 'oem', '三菱電機'),
  ('フィルター CS-XS908C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X289C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X908C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X909C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS228C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS368C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS568C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X639C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X719C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X568C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X409C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS718C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS408C', 'filter', 'oem', 'Panasonic'),
  ('ターンテーブル ER-MD7', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-N6', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-N6E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-ND7', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-P6', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-P6E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-PD7', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-R6', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-R6E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-RD7', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-S60', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-S60E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-SD70', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-T60', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-TD70', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-TD80', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-TD80E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-VD80', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-W60', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-W60E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-V60', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-V60E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-X60', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-XD80', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-ND300', 'turntable', 'oem', '東芝'),
  ('ターンテーブル AX-CX2', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-CX3', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-G1', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-HC1', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-M1', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-MX1', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-S1', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-X1', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-X2', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-LSX3A', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-XA30', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル NE-M152', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-T152', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-T154', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-T155', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-S420F', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-EH227', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-TH227', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS656', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS808', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS1500', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル MRO-N550', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-CV200', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-GV300', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-JV300', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-CS8', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-RY3000', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-SBK1', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-SF6', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-SV3000', 'turntable', 'oem', '日立'),
  ('ターンテーブル ER-M6E', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-F3', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-GE54', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-H3', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-J3', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-J3A', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-K3', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-YJ3', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-YJ3A', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-YK3', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-H10', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-SD100', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JD310', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JD310A', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JD410', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JD410A', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JD510', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JD510A', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-KD320', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-KD420', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-KD520', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-LD330', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-LD430', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-LD530', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-WD3000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル AX-GX2', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-PX1', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-PX2', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル NE-EH2', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-EH22', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-EZ2', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-S200F', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-EH212', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-EH228', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-TH224', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-TH228', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS658', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS6A', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS655', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS9C', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-JBS652', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-JBS653', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-JBS654', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-SBS656', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-UBS10C', 'turntable', 'oem', 'Panasonic')
on conflict do nothing;

insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id, null
from parts p
join appliances a on p.name like '%' || a.model_number
where a.model_number in ('ES-LP2', 'ES-LP1', 'ES-PX8C', 'ES-PX8D', 'ES-TX840', 'ES-GX850', 'ES-GX8A', 'ES-PX8B', 'ES-TX830', 'NA-FA120V1', 'NA-FA70H2', 'NA-FA70H3', 'NA-FA80H2', 'NA-FA80H3', 'NA-FA80H5', 'NA-FA80H6', 'NA-FA90H6', 'NA-FA90H5', 'NA-FA100H7', 'NA-FA80H7', 'NA-FA90H7', 'NA-FA120V2', 'NA-FA100H9', 'NA-FA10K1', 'NA-FA80H9', 'NA-FA90H9', 'NA-FA100H8', 'NA-FA80H8', 'NA-FW100K9', 'ES-GE7A', 'ES-TX74', 'BW-D10WV', 'BW-D10XTV', 'ES-GE60P', 'ES-GE70R', 'ES-GE7B', 'ES-GE7C', 'ES-GE7D', 'ES-PW10D', 'NA-FW100K8', 'NA-FA120V3', 'NA-FA90H8', 'ES-GE60N', 'ES-GV8A', 'ES-GV9B', 'ES-GV9C', 'ES-KSV9C', 'ES-PT10C', 'ES-PT10D', 'ES-PU10C', 'ES-PU11B', 'ES-PU11C', 'ES-PW11D', 'ES-PW8D', 'ES-PX10A', 'ES-PX10B', 'ES-PX9B', 'ES-T707', 'ES-T708', 'ES-T711', 'ES-TX8A', 'ES-TX8B', 'ES-TX8C', 'ES-TX930', 'ES-TX940', 'ES-TX9A', 'NA-F70PB15', 'ES-GE70N', 'ES-GE70P', 'ES-GV10B', 'ES-GV10C', 'ES-GV10D', 'ES-GV80R', 'ES-GV8B', 'ES-GV8C', 'ES-GV8D', 'ES-GV90R', 'ES-GV9A', 'ES-GV9D', 'ES-GW11D', 'ES-GX950', 'ES-GX9A', 'ES-KS70P', 'ES-KS70R', 'ES-KS70S', 'ES-KS70U', 'ES-T706', 'ES-TX8D', 'ES-GE55N', 'ES-KS70N', 'ES-KSV9B', 'ES-KSV9D', 'ES-T709', 'ES-T710', 'ES-TA840', 'ES-TX750', 'ES-TX850', 'ES-TX950', 'ES-TG74V', 'NA-F60PB12', 'MR-WX53Z', 'MR-JX53Z', 'MR-WX48Z', 'MR-WX61Z', 'MR-B46Z', 'MR-JX61Z', 'MR-WX70C', 'MR-WX71Z', 'MR-JX53X', 'MR-JX52W', 'MR-JX53Y', 'GR-M15BS', 'NR-F561XPV', 'MR-JX60W', 'MR-B46D', 'MR-MB45E', 'MR-MX57D', 'MR-RX46A', 'MR-WX61Y', 'MR-WX71Y', 'NR-E438T', 'NR-F605T', 'R-B6700', 'MR-JX64W', 'MR-JX52A', 'MR-JX60A', 'MR-MX50D', 'MR-JX61X', 'MR-JX61Y', 'GR-M17BS', 'GR-P15BS', 'GR-P17BS', 'GR-R15BS', 'GR-R17BS', 'GR-S15BS', 'GR-S17BS', 'GR-T15BS', 'GR-T17BS', 'GR-U15BS', 'GR-U17BS', 'GR-V15BS', 'GR-V17BS', 'NR-E434T', 'NR-F506XV', 'GR-G51FXV', 'GR-P510FD', 'NR-E434TL', 'NR-E435T', 'NR-E435TL', 'NR-E473TL', 'NR-F433T', 'NR-F434T', 'NR-F436T', 'NR-F505XV', 'NR-F618TV', 'NR-F555XV', 'NR-E437T', 'NR-B253T', 'MR-RX52T', 'NR-E474T', 'NR-F438T', 'NR-F557XV', 'MR-RX47T', 'MR-RX62T', 'MR-JX52C', 'MR-JX60C', 'MR-MX50F', 'MR-RX46C', 'MR-WX70A', 'MR-E47S', 'NR-F507XV', 'NR-E474TL', 'NR-F501XV', 'NR-F601XV', 'NR-F604T', 'NR-F606XV', 'NR-F603T', 'NR-F605XV', 'NR-E436T', 'NR-F475XPV', 'NR-F476XPV', 'NR-F486MEX', 'NR-F552XPV', 'R-A5700', 'R-A6200', 'MR-RX57T', 'MR-B46F', 'MR-MX46H', 'MR-MX50H', 'MR-WX47H', 'MR-WX60A', 'MR-E52S', 'MR-R47Y', 'NR-F500T', 'NR-E450TL', 'NR-E415PV', 'NR-E415PVL', 'NR-F504HPX', 'NR-F505HPX', 'NR-F506XPV', 'EC-SR10', 'V8 Absolute', 'PV-BEH900', 'EC-AR8', 'EC-HR7', 'EC-HR8', 'EC-SR7', 'EC-SR8', 'EC-SR9', 'PV-BFL1', 'EC-KR1', 'EC-AR10', 'EC-SX200', 'EC-FR9', 'EC-PR9', 'EC-A1R', 'EC-SX530', 'EC-AR5', 'EC-AR9', 'EC-SR5', 'EC-AR5X', 'EC-FR7', 'PV-BH900H', 'V7 Absolute', 'MC-SB34J', 'PV-BL30H', 'PV-BL10G', 'EC-AP700', 'EC-AS700', 'MC-SB53K', 'MC-PB60J', 'MC-SB54K', 'PV-BL30K', 'PV-BL50K', 'PV-BHL1000J', 'PV-BHL2000J', 'PV-BHL3000J', 'PV-BKL11G', 'PV-BL1H', 'PV-BL20G', 'PV-BL3J', 'V8 Slim', 'PV-BL30L', 'PV-BL50L', 'PV-BL50M', 'PV-BL2H', 'PV-BH500H', 'EC-FR11', 'PV-BEH900009', 'PV-BH900J', 'V6 Absolute', 'EC-KH7X', 'PV-BL50G', 'PV-BL50P', 'PV-BH900K', 'PV-BFL1008', 'EC-KR3', 'PV-BL3L', 'PV-BKL11L', 'NJ-BW10H', 'SR-SPA107', 'SR-PA107', 'SR-PA108', 'SR-PA106', 'SR-PA109', 'SR-SPA108', 'SR-PW108', 'SR-PW188', 'SR-SPA188', 'SR-VSX180', 'SR-VSX181', 'SR-VSX188', 'SR-VSX189', 'SR-HX185', 'SR-HX186', 'NW-YA10', 'NW-VA10', 'NP-VD10', 'NW-PS10', 'NW-PT10', 'NW-QA18', 'RC-108VSS', 'RC-109VSS', 'RC-10VRP', 'RC-10VSP', 'RC-10VSR', 'RC-10VRR', 'NJ-VW109', 'NJ-SW065', 'NJ-SW066', 'NJ-SW067', 'NJ-SW069', 'RZ-WG10M', 'RZ-TS180M', 'SR-PGC54A', 'NP-VI10', 'NP-VL10', 'NP-VN10', 'NP-VZ10', 'NP-HQ10', 'JPB1865', 'JPB-R180W', 'RC-6XJ', 'RC-6XK', 'RC-6XL', 'RC-6XM', 'NJ-SW068', 'NJ-VW107', 'NJ-SWB06', 'NJ-VP10H', 'RZ-WV100M', 'RZ-BV100M', 'RZ-FZ10J', 'RZ-SD10KSJ', 'RZ-TD10KSJ', 'SR-HBA101', 'SR-MPW101', 'SR-MPW102', 'SR-MPW100', 'SR-SA182', 'SR-SB182', 'SR-JX056', 'NP-BG10', 'NP-BH10', 'NP-BJ10', 'NW-VA18', 'NP-VD18', 'NW-FB18', 'NW-FA10', 'NW-FA18', 'NW-WA18', 'NP-RU05', 'NP-RT05', 'JPC-B100K', 'JPC-B100W', 'RC-18VQL', 'RC-18VQM', 'RC-10MSL', 'NJ-VW108', 'NJ-SWD06', 'NJ-VP18G', 'RZ-SX100J', 'RZ-XC10M', 'RAS-VJ4026D', 'MSZ-ZXV222', 'MSZ-ZXV252', 'MSZ-ZXV282S', 'MSZ-ZXV282', 'MSZ-ZXV362S', 'MSZ-ZXV362', 'MSZ-ZXV402S', 'MSZ-ZXV632S', 'MSZ-ZXV712S', 'MSZ-JXV257', 'CS-X229C', 'MSZ-BXV2218', 'MSZ-BXV2518', 'MSZ-BXV2818', 'MSZ-BXV3618', 'MSZ-BXV4018S', 'MSZ-BXV5618S', 'MSZ-HXV251', 'MSZ-HXV252', 'MSZ-HXV281S', 'MSZ-HXV282S', 'MSZ-HXV401S', 'MSZ-HXV402S', 'MSZ-HXV561S', 'MSZ-HXV562S', 'MSZ-ZW221', 'MSZ-ZW251', 'MSZ-ZW281S', 'MSZ-ZW281', 'MSZ-ZW361S', 'MSZ-ZW361', 'MSZ-ZW401S', 'MSZ-ZW561S', 'MSZ-ZW711S', 'MSZ-ZXV221', 'MSZ-ZXV251', 'MSZ-ZXV281S', 'MSZ-ZXV281', 'MSZ-ZXV361S', 'MSZ-ZXV361', 'MSZ-ZXV401S', 'MSZ-ZXV561S', 'MSZ-ZXV631S', 'MSZ-ZXV711S', 'MSZ-JXV2216', 'MSZ-JXV225', 'MSZ-JXV2516', 'MSZ-JXV255', 'MSZ-JXV2816S', 'MSZ-JXV2816', 'MSZ-JXV285S', 'MSZ-JXV285', 'MSZ-JXV3616S', 'MSZ-JXV3616', 'MSZ-JXV365S', 'MSZ-JXV365', 'MSZ-JXV4016S', 'MSZ-JXV405S', 'MSZ-JXV5616S', 'MSZ-JXV565S', 'MSZ-JXV6316S', 'MSZ-JXV7116S', 'MSZ-JXV227', 'MSZ-JXV287', 'MSZ-JXV367', 'MSZ-JXV407S', 'MSZ-JXV507S', 'CS-XS400D2', 'CS-XS800D2', 'CS-XS360D', 'CS-XS258C', 'CS-XS288C2', 'CS-X718C2', 'CS-XS408C2', 'CS-XS808C2', 'CS-XS368C', 'CS-X408C2', 'CS-XS638C2', 'CS-X808C2', 'CS-X408C', 'CS-XS288C', 'CS-X288CZ', 'CS-X638C2', 'CS-X368C', 'RAS-AJ22F', 'RAS-MJ7126D', 'CS-X569C2', 'CS-X409C2', 'CS-X809C2', 'RAS-VL6325D', 'MSZ-NXV5619S', 'MSZ-HXV7118S', 'MSZ-ZW631S', 'MSZ-ZXV562S', 'CS-XS400D', 'CS-XS710D2', 'CS-XS250D', 'CS-XS280D2', 'RAS-VJ4025D', 'MSZ-HXV2516', 'MSZ-HXV2816S', 'MSZ-HXV4016S', 'MSZ-HXV5616S', 'MSZ-HXV6316S', 'MSZ-ZW714S', 'MSZ-ZW227', 'CS-XS908C2', 'CS-X289C', 'CS-X908C2', 'CS-X909C2', 'CS-XS228C', 'CS-XS368C2', 'CS-XS568C2', 'CS-X639C2', 'CS-X719C2', 'CS-X568C2', 'CS-X409C', 'CS-XS718C2', 'CS-XS408C', 'ER-MD7', 'ER-N6', 'ER-N6E', 'ER-ND7', 'ER-P6', 'ER-P6E', 'ER-PD7', 'ER-R6', 'ER-R6E', 'ER-RD7', 'ER-S60', 'ER-S60E', 'ER-SD70', 'ER-T60', 'ER-TD70', 'ER-TD80', 'ER-TD80E', 'ER-VD80', 'ER-W60', 'ER-W60E', 'ER-V60', 'ER-V60E', 'ER-X60', 'ER-XD80', 'ER-ND300', 'AX-CX2', 'AX-CX3', 'AX-G1', 'AX-HC1', 'AX-M1', 'AX-MX1', 'AX-S1', 'AX-X1', 'AX-X2', 'AX-LSX3A', 'AX-XA30', 'NE-M152', 'NE-T152', 'NE-T154', 'NE-T155', 'NE-S420F', 'NE-EH227', 'NE-TH227', 'NE-BS656', 'NE-BS808', 'NE-BS1500', 'MRO-N550', 'MRO-CV200', 'MRO-GV300', 'MRO-JV300', 'MRO-CS8', 'MRO-RY3000', 'MRO-SBK1', 'MRO-SF6', 'MRO-SV3000', 'ER-M6E', 'ER-F3', 'ER-GE54', 'ER-H3', 'ER-J3', 'ER-J3A', 'ER-K3', 'ER-YJ3', 'ER-YJ3A', 'ER-YK3', 'ER-H10', 'ER-SD100', 'ER-JD310', 'ER-JD310A', 'ER-JD410', 'ER-JD410A', 'ER-JD510', 'ER-JD510A', 'ER-KD320', 'ER-KD420', 'ER-KD520', 'ER-LD330', 'ER-LD430', 'ER-LD530', 'ER-WD3000', 'AX-GX2', 'AX-PX1', 'AX-PX2', 'NE-EH2', 'NE-EH22', 'NE-EZ2', 'NE-S200F', 'NE-EH212', 'NE-EH228', 'NE-TH224', 'NE-TH228', 'NE-BS658', 'NE-BS6A', 'NE-BS655', 'NE-BS9C', 'NE-JBS652', 'NE-JBS653', 'NE-JBS654', 'NE-SBS656', 'NE-UBS10C')
and not exists (
  select 1 from appliance_parts ap where ap.appliance_id = a.id and ap.part_id = p.id
);
-- ============================================================
-- discover-appliances.ts 由来 v4 (final max expansion)
-- 2203 additional models from candidate pool
-- ============================================================
insert into appliances (manufacturer, category, model_number) values
  ('ダイソン', 'vacuum', 'V8 Absolute'),
  ('Panasonic', 'washing_machine', 'NA-FA10K2'),
  ('シャープ', 'washing_machine', 'ES-GE60R'),
  ('シャープ', 'washing_machine', 'ES-GE6A'),
  ('シャープ', 'washing_machine', 'ES-GE6C'),
  ('シャープ', 'washing_machine', 'ES-GV7D'),
  ('シャープ', 'washing_machine', 'ES-KS70T'),
  ('シャープ', 'washing_machine', 'ES-KSV9A'),
  ('Panasonic', 'washing_machine', 'NA-F60PB9'),
  ('Panasonic', 'washing_machine', 'NA-F70PB10'),
  ('Panasonic', 'washing_machine', 'NA-F70PB11'),
  ('Panasonic', 'washing_machine', 'NA-F70PB9'),
  ('Panasonic', 'washing_machine', 'NA-FA7H2'),
  ('日立', 'washing_machine', 'BW-CSD7TV'),
  ('日立', 'washing_machine', 'BW-D702S'),
  ('シャープ', 'washing_machine', 'ES-GE55P'),
  ('Panasonic', 'washing_machine', 'NA-FA90H2'),
  ('Panasonic', 'washing_machine', 'NA-FA90H3'),
  ('Panasonic', 'washing_machine', 'NA-FW120V1'),
  ('日立', 'washing_machine', 'BW-D10TV'),
  ('シャープ', 'washing_machine', 'ES-GE7E'),
  ('シャープ', 'washing_machine', 'ES-GE7F'),
  ('シャープ', 'washing_machine', 'ES-GE7G'),
  ('シャープ', 'washing_machine', 'ES-GV10E'),
  ('シャープ', 'washing_machine', 'ES-GV7C'),
  ('シャープ', 'washing_machine', 'ES-GV80P'),
  ('シャープ', 'washing_machine', 'ES-GV8E'),
  ('シャープ', 'washing_machine', 'ES-GV90P'),
  ('シャープ', 'washing_machine', 'ES-KSV9F'),
  ('シャープ', 'washing_machine', 'ES-KSV9G'),
  ('シャープ', 'washing_machine', 'ES-PT10F'),
  ('シャープ', 'washing_machine', 'ES-PT10G'),
  ('シャープ', 'washing_machine', 'ES-PW10E'),
  ('シャープ', 'washing_machine', 'ES-PW11E'),
  ('シャープ', 'washing_machine', 'ES-PW11F'),
  ('シャープ', 'washing_machine', 'ES-PW11G'),
  ('シャープ', 'washing_machine', 'ES-PW8E'),
  ('シャープ', 'washing_machine', 'ES-PW8G'),
  ('シャープ', 'washing_machine', 'ES-PX8E'),
  ('シャープ', 'washing_machine', 'ES-PX8F'),
  ('シャープ', 'washing_machine', 'ES-T714'),
  ('シャープ', 'washing_machine', 'ES-T715'),
  ('シャープ', 'washing_machine', 'ES-TX8F'),
  ('シャープ', 'washing_machine', 'ES-TX8G'),
  ('Panasonic', 'washing_machine', 'NA-F50B9'),
  ('Panasonic', 'washing_machine', 'NA-F60B9'),
  ('Panasonic', 'washing_machine', 'NA-F70PB12'),
  ('Panasonic', 'washing_machine', 'NA-F8AE7'),
  ('Panasonic', 'washing_machine', 'NA-F9AE7'),
  ('Panasonic', 'washing_machine', 'NA-FA70H7'),
  ('Panasonic', 'washing_machine', 'NA-FW120V2'),
  ('Panasonic', 'washing_machine', 'NA-F7PB2'),
  ('Panasonic', 'washing_machine', 'NA-F8AE9'),
  ('Panasonic', 'washing_machine', 'NA-F8AKE1'),
  ('Panasonic', 'washing_machine', 'NA-F9AE9'),
  ('Panasonic', 'washing_machine', 'NA-F9AKE1'),
  ('Panasonic', 'washing_machine', 'NA-FA110K5'),
  ('Panasonic', 'washing_machine', 'NA-FA11K1'),
  ('Panasonic', 'washing_machine', 'NA-FA120V5'),
  ('Panasonic', 'washing_machine', 'NA-FA12V1'),
  ('Panasonic', 'washing_machine', 'NA-FA8H2'),
  ('Panasonic', 'washing_machine', 'NA-FA8K1'),
  ('シャープ', 'washing_machine', 'ES-GV10F'),
  ('シャープ', 'washing_machine', 'ES-GV10G'),
  ('シャープ', 'washing_machine', 'ES-GV8F'),
  ('シャープ', 'washing_machine', 'ES-GV8G'),
  ('シャープ', 'washing_machine', 'ES-GV9E'),
  ('シャープ', 'washing_machine', 'ES-GV9G'),
  ('シャープ', 'washing_machine', 'ES-GW11E'),
  ('シャープ', 'washing_machine', 'ES-GW11F'),
  ('シャープ', 'washing_machine', 'ES-GW11G'),
  ('シャープ', 'washing_machine', 'ES-A70E'),
  ('シャープ', 'washing_machine', 'ES-A80E'),
  ('シャープ', 'washing_machine', 'ES-AG70D'),
  ('シャープ', 'washing_machine', 'ES-AG80D'),
  ('シャープ', 'washing_machine', 'ES-B75D'),
  ('シャープ', 'washing_machine', 'ES-SE71E'),
  ('Panasonic', 'washing_machine', 'NA-F50B10'),
  ('Panasonic', 'washing_machine', 'NA-F50B11'),
  ('Panasonic', 'washing_machine', 'NA-F50B13'),
  ('Panasonic', 'washing_machine', 'NA-F50BE5'),
  ('Panasonic', 'washing_machine', 'NA-F50BE7'),
  ('Panasonic', 'washing_machine', 'NA-F60B10'),
  ('Panasonic', 'washing_machine', 'NA-F60B11'),
  ('Panasonic', 'washing_machine', 'NA-F60B13'),
  ('Panasonic', 'washing_machine', 'NA-F70BE6'),
  ('Panasonic', 'washing_machine', 'NA-F60PB14'),
  ('Panasonic', 'washing_machine', 'NA-F60PB15'),
  ('Panasonic', 'washing_machine', 'NA-VX9900L'),
  ('Panasonic', 'washing_machine', 'NA-VX9900R'),
  ('シャープ', 'washing_machine', 'ES-GE6E'),
  ('シャープ', 'washing_machine', 'ES-KSV9E'),
  ('シャープ', 'washing_machine', 'ES-T712'),
  ('シャープ', 'washing_machine', 'ES-T713'),
  ('Panasonic', 'washing_machine', 'NA-F50B12'),
  ('Panasonic', 'washing_machine', 'NA-F50BE6'),
  ('Panasonic', 'washing_machine', 'NA-F50ME3'),
  ('Panasonic', 'washing_machine', 'NA-F50ME4'),
  ('Panasonic', 'washing_machine', 'NA-F60B12'),
  ('Panasonic', 'washing_machine', 'NA-TF595'),
  ('Panasonic', 'washing_machine', 'NA-F10WE8'),
  ('Panasonic', 'washing_machine', 'NA-F9WE8'),
  ('Panasonic', 'washing_machine', 'NA-FD80H8'),
  ('Panasonic', 'washing_machine', 'NA-FW108KS'),
  ('Panasonic', 'washing_machine', 'NA-FW120V3'),
  ('Panasonic', 'washing_machine', 'NA-FW80K8'),
  ('Panasonic', 'washing_machine', 'NA-FW90K8'),
  ('Panasonic', 'washing_machine', 'NA-F8AE8'),
  ('Panasonic', 'washing_machine', 'NA-F9AE8'),
  ('Panasonic', 'washing_machine', 'NA-FA70H8'),
  ('Panasonic', 'washing_machine', 'NA-FA7H1'),
  ('Panasonic', 'washing_machine', 'NA-F10AKE1'),
  ('Panasonic', 'washing_machine', 'NA-F10WE9'),
  ('Panasonic', 'washing_machine', 'NA-F5B2'),
  ('Panasonic', 'washing_machine', 'NA-F7B2'),
  ('Panasonic', 'washing_machine', 'NA-FA9K1'),
  ('Panasonic', 'washing_machine', 'NA-FW10K1'),
  ('Panasonic', 'washing_machine', 'NA-FW120V5'),
  ('Panasonic', 'washing_machine', 'NA-FW12V1'),
  ('Panasonic', 'washing_machine', 'NA-FW80K9'),
  ('Panasonic', 'washing_machine', 'NA-FW90K9'),
  ('Panasonic', 'washing_machine', 'NA-FA70H9'),
  ('Panasonic', 'washing_machine', 'NA-VX9800L'),
  ('日立', 'washing_machine', 'BW-D11XWV'),
  ('日立', 'washing_machine', 'BW-D9WV'),
  ('シャープ', 'washing_machine', 'ES-GV7E'),
  ('シャープ', 'washing_machine', 'ES-GV7F'),
  ('シャープ', 'washing_machine', 'ES-GV7G'),
  ('シャープ', 'washing_machine', 'ES-KS70V'),
  ('シャープ', 'washing_machine', 'ES-KS70W'),
  ('シャープ', 'washing_machine', 'ES-D75D'),
  ('シャープ', 'washing_machine', 'ES-KG73V'),
  ('シャープ', 'washing_machine', 'ES-KG83V'),
  ('シャープ', 'washing_machine', 'ES-LC70B'),
  ('シャープ', 'washing_machine', 'ES-LC80B'),
  ('シャープ', 'washing_machine', 'ES-TG70F'),
  ('シャープ', 'washing_machine', 'ES-TG70G'),
  ('シャープ', 'washing_machine', 'ES-TG80F'),
  ('シャープ', 'washing_machine', 'ES-TG81G'),
  ('シャープ', 'washing_machine', 'ES-TG830'),
  ('シャープ', 'washing_machine', 'ES-TG84V'),
  ('シャープ', 'washing_machine', 'ES-U70C'),
  ('シャープ', 'washing_machine', 'ES-U80C'),
  ('Panasonic', 'washing_machine', 'NA-F50B14'),
  ('Panasonic', 'washing_machine', 'NA-F50BE8'),
  ('Panasonic', 'washing_machine', 'NA-F60B14'),
  ('Panasonic', 'washing_machine', 'NA-F70PB14'),
  ('Panasonic', 'washing_machine', 'NA-JFA807'),
  ('Panasonic', 'washing_machine', 'NA-F50B15'),
  ('Panasonic', 'washing_machine', 'NA-F60B15'),
  ('Panasonic', 'washing_machine', 'NA-JFA808'),
  ('Panasonic', 'washing_machine', 'NA-SJFA808'),
  ('Panasonic', 'washing_machine', 'NA-VX900AR'),
  ('Panasonic', 'washing_machine', 'NA-VX7700L'),
  ('Panasonic', 'washing_machine', 'NA-VX9800R'),
  ('日立', 'washing_machine', 'BW-V70G'),
  ('シャープ', 'washing_machine', 'ES-GE6F'),
  ('シャープ', 'washing_machine', 'ES-GE6G'),
  ('シャープ', 'washing_machine', 'ES-TX5E'),
  ('シャープ', 'washing_machine', 'ES-TX5F'),
  ('シャープ', 'washing_machine', 'ES-TX6G'),
  ('Panasonic', 'washing_machine', 'NA-F10AKE3'),
  ('Panasonic', 'washing_machine', 'NA-F6PB1'),
  ('Panasonic', 'washing_machine', 'NA-F7PB1'),
  ('Panasonic', 'washing_machine', 'NA-F8AKE3'),
  ('Panasonic', 'washing_machine', 'NA-FA11K2'),
  ('Panasonic', 'washing_machine', 'NA-VX7500L'),
  ('シャープ', 'washing_machine', 'ES-GE7H'),
  ('シャープ', 'washing_machine', 'ES-PT10H'),
  ('シャープ', 'washing_machine', 'ES-PW11H'),
  ('シャープ', 'washing_machine', 'ES-PW8H'),
  ('シャープ', 'washing_machine', 'ES-SW11H'),
  ('シャープ', 'washing_machine', 'ES-TX8H'),
  ('シャープ', 'washing_machine', 'ES-TG820'),
  ('Panasonic', 'washing_machine', 'NA-SJFA807'),
  ('Panasonic', 'washing_machine', 'NA-FA10K3'),
  ('Panasonic', 'washing_machine', 'NA-VX8700L'),
  ('Panasonic', 'washing_machine', 'NA-VX8800L'),
  ('Panasonic', 'washing_machine', 'NA-VX8800R'),
  ('日立', 'washing_machine', 'BW-D70WV'),
  ('日立', 'washing_machine', 'BW-D8WV'),
  ('日立', 'washing_machine', 'BW-D90TS'),
  ('日立', 'washing_machine', 'BW-DBK70B'),
  ('日立', 'washing_machine', 'BW-DV703S'),
  ('日立', 'washing_machine', 'BW-DV80A'),
  ('日立', 'washing_machine', 'BW-DV80B'),
  ('日立', 'washing_machine', 'BW-DV90A'),
  ('日立', 'washing_machine', 'BW-DV90B'),
  ('シャープ', 'washing_machine', 'ES-GV10H'),
  ('シャープ', 'washing_machine', 'ES-GV8H'),
  ('シャープ', 'washing_machine', 'ES-GV9H'),
  ('Panasonic', 'washing_machine', 'NA-F50BE9'),
  ('Panasonic', 'washing_machine', 'NA-F5B1'),
  ('Panasonic', 'washing_machine', 'NA-F5BE2'),
  ('Panasonic', 'washing_machine', 'NA-F5BE3'),
  ('Panasonic', 'washing_machine', 'NA-F6B1'),
  ('Panasonic', 'washing_machine', 'NA-F6B2'),
  ('Panasonic', 'washing_machine', 'NA-F9AKE3'),
  ('Panasonic', 'washing_machine', 'NA-FA12V2'),
  ('Panasonic', 'washing_machine', 'NA-FA9K2')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('Panasonic', 'washing_machine', 'NA-FW10K2'),
  ('Panasonic', 'washing_machine', 'NA-JFA8K2'),
  ('Panasonic', 'washing_machine', 'NA-SJFA8K2'),
  ('Panasonic', 'washing_machine', 'NA-SVX880L'),
  ('Panasonic', 'washing_machine', 'NA-SVX880R'),
  ('Panasonic', 'washing_machine', 'NA-VX7600L'),
  ('Panasonic', 'washing_machine', 'NA-VX7700R'),
  ('Panasonic', 'washing_machine', 'NA-VX8500L'),
  ('日立', 'washing_machine', 'BW-D7SV'),
  ('日立', 'washing_machine', 'BW-DV100A'),
  ('日立', 'washing_machine', 'BW-DV100B'),
  ('日立', 'washing_machine', 'BW-DX110A'),
  ('シャープ', 'washing_machine', 'ES-KSV9H'),
  ('シャープ', 'washing_machine', 'ES-C75D'),
  ('Panasonic', 'washing_machine', 'NA-FA8H3'),
  ('日立', 'washing_machine', 'BW-D9SV'),
  ('シャープ', 'washing_machine', 'ES-A116'),
  ('シャープ', 'washing_machine', 'ES-A117'),
  ('シャープ', 'washing_machine', 'ES-A60S'),
  ('シャープ', 'washing_machine', 'ES-A70S'),
  ('シャープ', 'washing_machine', 'ES-D7S'),
  ('シャープ', 'washing_machine', 'ES-DD8E'),
  ('シャープ', 'washing_machine', 'ES-E71P'),
  ('シャープ', 'washing_machine', 'ES-FG60H'),
  ('シャープ', 'washing_machine', 'ES-FG60J'),
  ('シャープ', 'washing_machine', 'ES-FG64'),
  ('シャープ', 'washing_machine', 'ES-FG65'),
  ('ダイソン', 'vacuum', 'V7 Absolute'),
  ('Panasonic', 'washing_machine', 'NA-VX7800L'),
  ('Panasonic', 'washing_machine', 'NA-VX7800R'),
  ('Panasonic', 'washing_machine', 'NA-VX8700R'),
  ('Panasonic', 'washing_machine', 'NA-VX8900L'),
  ('Panasonic', 'washing_machine', 'NA-VX8900R'),
  ('Panasonic', 'washing_machine', 'NA-VX8500R'),
  ('日立', 'washing_machine', 'BW-D8SV'),
  ('日立', 'washing_machine', 'BW-D8TV'),
  ('日立', 'washing_machine', 'BW-D9TV'),
  ('シャープ', 'washing_machine', 'ES-GE6H'),
  ('シャープ', 'washing_machine', 'ES-GE6J'),
  ('シャープ', 'washing_machine', 'ES-GE7J'),
  ('シャープ', 'washing_machine', 'ES-SW10J'),
  ('シャープ', 'washing_machine', 'ES-SW11J'),
  ('シャープ', 'washing_machine', 'ES-T716'),
  ('シャープ', 'washing_machine', 'ES-TX6H'),
  ('シャープ', 'washing_machine', 'ES-FG70G'),
  ('シャープ', 'washing_machine', 'ES-FG70H'),
  ('シャープ', 'washing_machine', 'ES-FG73'),
  ('シャープ', 'washing_machine', 'ES-FG74V'),
  ('シャープ', 'washing_machine', 'ES-FG84V'),
  ('シャープ', 'washing_machine', 'ES-GE60K'),
  ('シャープ', 'washing_machine', 'ES-GE60L'),
  ('シャープ', 'washing_machine', 'ES-GE70L'),
  ('シャープ', 'washing_machine', 'ES-GE80L'),
  ('シャープ', 'washing_machine', 'ES-K700'),
  ('シャープ', 'washing_machine', 'ES-M7K'),
  ('シャープ', 'washing_machine', 'ES-SE81'),
  ('シャープ', 'washing_machine', 'ES-SE91'),
  ('シャープ', 'washing_machine', 'ES-T701'),
  ('シャープ', 'washing_machine', 'ES-T703'),
  ('シャープ', 'washing_machine', 'ES-T704'),
  ('シャープ', 'washing_machine', 'ES-TG60F'),
  ('シャープ', 'washing_machine', 'ES-TG60G'),
  ('シャープ', 'washing_machine', 'ES-TG60H'),
  ('シャープ', 'washing_machine', 'ES-TG60J'),
  ('シャープ', 'washing_machine', 'ES-TG60K'),
  ('シャープ', 'washing_machine', 'ES-TG60L'),
  ('シャープ', 'washing_machine', 'ES-TX71'),
  ('シャープ', 'washing_machine', 'ES-TX72'),
  ('シャープ', 'washing_machine', 'ES-TX800'),
  ('シャープ', 'washing_machine', 'ES-TX810'),
  ('シャープ', 'washing_machine', 'ES-TX820'),
  ('シャープ', 'washing_machine', 'ES-U70D'),
  ('シャープ', 'washing_machine', 'ES-U80D'),
  ('Panasonic', 'washing_machine', 'NA-F8AKE4'),
  ('Panasonic', 'washing_machine', 'NA-F9AKE4'),
  ('Panasonic', 'washing_machine', 'NA-FA10H3'),
  ('Panasonic', 'washing_machine', 'NA-FA11K3'),
  ('Panasonic', 'washing_machine', 'NA-F10AKE4'),
  ('Panasonic', 'washing_machine', 'NA-FA8K3'),
  ('Panasonic', 'washing_machine', 'NA-FA9K3'),
  ('Panasonic', 'washing_machine', 'NA-FA12V3'),
  ('Panasonic', 'washing_machine', 'NA-FA7H3'),
  ('Panasonic', 'washing_machine', 'NA-VG1200L'),
  ('Panasonic', 'washing_machine', 'NA-VX800AL'),
  ('Panasonic', 'washing_machine', 'NA-VX8600L'),
  ('Panasonic', 'washing_machine', 'NA-VX9700L'),
  ('Panasonic', 'washing_machine', 'NA-VX9700R'),
  ('Panasonic', 'washing_machine', 'NA-VX850SL'),
  ('日立', 'washing_machine', 'BW-DBK70C'),
  ('日立', 'washing_machine', 'BW-DV100E'),
  ('日立', 'washing_machine', 'BW-DV80C'),
  ('日立', 'washing_machine', 'BW-DV80E'),
  ('日立', 'washing_machine', 'BW-DV90C'),
  ('日立', 'washing_machine', 'BW-DV90E'),
  ('日立', 'washing_machine', 'BW-DV9F'),
  ('日立', 'washing_machine', 'BW-E470HV'),
  ('日立', 'washing_machine', 'BW-E480HV'),
  ('日立', 'washing_machine', 'BW-E570JV'),
  ('日立', 'washing_machine', 'BW-E580JV'),
  ('日立', 'washing_machine', 'BW-E670KV'),
  ('日立', 'washing_machine', 'BW-E680KV'),
  ('日立', 'washing_machine', 'BW-KSV100B'),
  ('日立', 'washing_machine', 'BW-T800'),
  ('日立', 'washing_machine', 'BW-T803'),
  ('日立', 'washing_machine', 'BW-T804'),
  ('日立', 'washing_machine', 'BW-V100A'),
  ('日立', 'washing_machine', 'BW-V100B'),
  ('日立', 'washing_machine', 'BW-V70A'),
  ('日立', 'washing_machine', 'BW-V70B'),
  ('日立', 'washing_machine', 'BW-V80A'),
  ('日立', 'washing_machine', 'BW-V80B'),
  ('日立', 'washing_machine', 'BW-V90A'),
  ('日立', 'washing_machine', 'BW-V90B'),
  ('日立', 'washing_machine', 'BW-D7'),
  ('日立', 'washing_machine', 'BW-DV100BBW'),
  ('シャープ', 'washing_machine', 'ES-GV10J'),
  ('シャープ', 'washing_machine', 'ES-GV7H'),
  ('シャープ', 'washing_machine', 'ES-GV7J'),
  ('シャープ', 'washing_machine', 'ES-GV7K'),
  ('シャープ', 'washing_machine', 'ES-GV8J'),
  ('シャープ', 'washing_machine', 'ES-GV8K'),
  ('シャープ', 'washing_machine', 'ES-GV9J'),
  ('シャープ', 'washing_machine', 'ES-LT1'),
  ('シャープ', 'washing_machine', 'ES-FG60F'),
  ('シャープ', 'washing_machine', 'ES-FG75'),
  ('シャープ', 'washing_machine', 'ES-GE70K'),
  ('シャープ', 'washing_machine', 'ES-TG72'),
  ('シャープ', 'washing_machine', 'ES-TG73'),
  ('シャープ', 'washing_machine', 'ES-TX70'),
  ('シャープ', 'washing_machine', 'ES-TX73'),
  ('東芝', 'washing_machine', 'AW-70VF'),
  ('東芝', 'washing_machine', 'AW-70VG'),
  ('東芝', 'washing_machine', 'AW-70VJ'),
  ('東芝', 'washing_machine', 'AW-80VF'),
  ('東芝', 'washing_machine', 'AW-80VG'),
  ('東芝', 'washing_machine', 'AW-80VJ'),
  ('東芝', 'washing_machine', 'AW-70VB'),
  ('東芝', 'washing_machine', 'AW-80VB'),
  ('東芝', 'washing_machine', 'AW-80VC'),
  ('ダイソン', 'vacuum', 'V8 Slim'),
  ('Panasonic', 'washing_machine', 'NA-SVX80AL'),
  ('Panasonic', 'washing_machine', 'NA-SVX80AR'),
  ('Panasonic', 'washing_machine', 'NA-SVX870R'),
  ('Panasonic', 'washing_machine', 'NA-SVX890L'),
  ('Panasonic', 'washing_machine', 'NA-SVX890R'),
  ('Panasonic', 'washing_machine', 'NA-VX3600L'),
  ('Panasonic', 'washing_machine', 'NA-VX800AR'),
  ('Panasonic', 'washing_machine', 'NA-VX8600'),
  ('Panasonic', 'washing_machine', 'NA-VX860S'),
  ('Panasonic', 'washing_machine', 'NA-VX900BL'),
  ('Panasonic', 'washing_machine', 'NA-VX9500L'),
  ('Panasonic', 'washing_machine', 'NA-VX9500R'),
  ('Panasonic', 'washing_machine', 'NA-VX850SR'),
  ('Panasonic', 'washing_machine', 'NA-VX7500R'),
  ('日立', 'washing_machine', 'BW-D6MV'),
  ('日立', 'washing_machine', 'BW-D7FV'),
  ('日立', 'washing_machine', 'BW-D7MV'),
  ('日立', 'washing_machine', 'BW-D8FV'),
  ('日立', 'washing_machine', 'BW-D8GV'),
  ('日立', 'washing_machine', 'BW-D8HV'),
  ('日立', 'washing_machine', 'BW-DV80F'),
  ('日立', 'washing_machine', 'BW-DX120B'),
  ('日立', 'washing_machine', 'BW-DX120F'),
  ('日立', 'washing_machine', 'BW-KSX100F'),
  ('日立', 'washing_machine', 'BW-T807'),
  ('日立', 'washing_machine', 'BW-V70F'),
  ('日立', 'washing_machine', 'BW-V80F'),
  ('日立', 'washing_machine', 'BW-V90F'),
  ('日立', 'washing_machine', 'BW-X100F'),
  ('日立', 'washing_machine', 'BW-X100G'),
  ('日立', 'washing_machine', 'BW-X90G'),
  ('日立', 'washing_machine', 'BW-V80G'),
  ('シャープ', 'washing_machine', 'ES-KSV9J'),
  ('シャープ', 'washing_machine', 'ES-PW11J'),
  ('シャープ', 'washing_machine', 'ES-PW8J'),
  ('シャープ', 'washing_machine', 'ES-SH7J'),
  ('シャープ', 'washing_machine', 'ES-T717'),
  ('シャープ', 'washing_machine', 'ES-TX6J'),
  ('シャープ', 'washing_machine', 'ES-TX8J'),
  ('シャープ', 'washing_machine', 'ES-G70'),
  ('シャープ', 'washing_machine', 'ES-SE71'),
  ('シャープ', 'washing_machine', 'ES-T702'),
  ('シャープ', 'washing_machine', 'ES-X11A'),
  ('シャープ', 'washing_machine', 'ES-T805'),
  ('東芝', 'washing_machine', 'AW-70DE'),
  ('東芝', 'washing_machine', 'AW-70DF'),
  ('東芝', 'washing_machine', 'AW-70DG'),
  ('東芝', 'washing_machine', 'AW-70DJ'),
  ('東芝', 'washing_machine', 'AW-70DK'),
  ('東芝', 'washing_machine', 'AW-70DL'),
  ('東芝', 'washing_machine', 'AW-80DE'),
  ('東芝', 'washing_machine', 'AW-80DF'),
  ('東芝', 'washing_machine', 'AW-80DG'),
  ('東芝', 'washing_machine', 'AW-80DJ'),
  ('東芝', 'washing_machine', 'AW-80DK'),
  ('東芝', 'washing_machine', 'AW-80DL'),
  ('東芝', 'washing_machine', 'AW-80SVL'),
  ('東芝', 'washing_machine', 'AW-10VP2'),
  ('東芝', 'washing_machine', 'AW-70VC'),
  ('Panasonic', 'washing_machine', 'NA-VG1300L')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('Panasonic', 'washing_machine', 'NA-VG1400L'),
  ('Panasonic', 'washing_machine', 'NA-VX3700L'),
  ('Panasonic', 'washing_machine', 'NA-VX9600R'),
  ('日立', 'washing_machine', 'BW-D6PV'),
  ('日立', 'washing_machine', 'BW-D7PV'),
  ('日立', 'washing_machine', 'BW-D8PV'),
  ('シャープ', 'washing_machine', 'ES-GV10K'),
  ('シャープ', 'washing_machine', 'ES-JV9A'),
  ('シャープ', 'washing_machine', 'ES-BG550'),
  ('シャープ', 'washing_machine', 'ES-BG551'),
  ('シャープ', 'washing_machine', 'ES-BG554'),
  ('シャープ', 'washing_machine', 'ES-C55S'),
  ('シャープ', 'washing_machine', 'ES-C60S'),
  ('シャープ', 'washing_machine', 'ES-CL75D'),
  ('シャープ', 'washing_machine', 'ES-CY75D'),
  ('シャープ', 'washing_machine', 'ES-D55S'),
  ('シャープ', 'washing_machine', 'ES-D60S'),
  ('シャープ', 'washing_machine', 'ES-F505'),
  ('シャープ', 'washing_machine', 'ES-FG54'),
  ('シャープ', 'washing_machine', 'ES-FG55'),
  ('シャープ', 'washing_machine', 'ES-FG55F'),
  ('シャープ', 'washing_machine', 'ES-FG55H'),
  ('シャープ', 'washing_machine', 'ES-FG55J'),
  ('シャープ', 'washing_machine', 'ES-GE55K'),
  ('シャープ', 'washing_machine', 'ES-T705'),
  ('シャープ', 'washing_machine', 'ES-X11B'),
  ('東芝', 'washing_machine', 'AW-70VJE7'),
  ('東芝', 'washing_machine', 'AW-70VK'),
  ('東芝', 'washing_machine', 'AW-70VKE8'),
  ('東芝', 'washing_machine', 'AW-70VL'),
  ('東芝', 'washing_machine', 'AW-70VLE9'),
  ('東芝', 'washing_machine', 'AW-80VJE7'),
  ('東芝', 'washing_machine', 'AW-80VK'),
  ('東芝', 'washing_machine', 'AW-80VKE8'),
  ('東芝', 'washing_machine', 'AW-10SD5'),
  ('東芝', 'washing_machine', 'AW-10SD6'),
  ('東芝', 'washing_machine', 'AW-10SD7'),
  ('東芝', 'washing_machine', 'AW-10SV5'),
  ('東芝', 'washing_machine', 'AW-10SV6'),
  ('東芝', 'washing_machine', 'AW-10SV7'),
  ('東芝', 'washing_machine', 'AW-10SV8'),
  ('東芝', 'washing_machine', 'AW-10SV9'),
  ('東芝', 'washing_machine', 'AW-10VH1'),
  ('東芝', 'washing_machine', 'AW-60GE'),
  ('東芝', 'washing_machine', 'AW-6DH2'),
  ('東芝', 'washing_machine', 'AW-70DB'),
  ('東芝', 'washing_machine', 'AW-70DC'),
  ('東芝', 'washing_machine', 'AW-7DH2'),
  ('東芝', 'washing_machine', 'AW-80DC'),
  ('Panasonic', 'refrigerator', 'NR-F511XPV'),
  ('日立', 'refrigerator', 'R-C4800'),
  ('日立', 'refrigerator', 'R-C5200'),
  ('日立', 'refrigerator', 'R-C5700'),
  ('日立', 'refrigerator', 'R-C6200'),
  ('日立', 'refrigerator', 'R-K40G'),
  ('三菱電機', 'refrigerator', 'MR-R47T'),
  ('三菱電機', 'refrigerator', 'MR-WX70E'),
  ('東芝', 'refrigerator', 'GR-K510FWX'),
  ('東芝', 'refrigerator', 'GR-K510FD'),
  ('東芝', 'refrigerator', 'GR-K460FW'),
  ('Panasonic', 'washing_machine', 'NA-FA70H1'),
  ('Panasonic', 'washing_machine', 'NA-SVX870L'),
  ('Panasonic', 'washing_machine', 'NA-VX7600'),
  ('Panasonic', 'washing_machine', 'NA-VX7600R'),
  ('Panasonic', 'washing_machine', 'NA-VX8600R'),
  ('Panasonic', 'washing_machine', 'NA-VX900BR'),
  ('Panasonic', 'washing_machine', 'NA-VX9600L'),
  ('日立', 'washing_machine', 'BW-D6LV'),
  ('日立', 'washing_machine', 'BW-D7LV'),
  ('日立', 'washing_machine', 'BW-D8JV'),
  ('日立', 'washing_machine', 'BW-D8KV'),
  ('日立', 'washing_machine', 'BW-D8LV'),
  ('日立', 'washing_machine', 'BW-D8MV'),
  ('日立', 'washing_machine', 'BW-D9GV'),
  ('日立', 'washing_machine', 'BW-D9HV'),
  ('日立', 'washing_machine', 'BW-DV100C'),
  ('日立', 'washing_machine', 'BW-DV120C'),
  ('日立', 'washing_machine', 'BW-DV120E'),
  ('日立', 'washing_machine', 'BW-DV8E'),
  ('日立', 'washing_machine', 'BW-DX120C'),
  ('日立', 'washing_machine', 'BW-DX120E'),
  ('シャープ', 'washing_machine', 'ES-HG90'),
  ('シャープ', 'washing_machine', 'ES-KG73'),
  ('シャープ', 'washing_machine', 'ES-U111'),
  ('シャープ', 'washing_machine', 'ES-W111'),
  ('シャープ', 'washing_machine', 'ES-WD74'),
  ('シャープ', 'washing_machine', 'ES-WD741'),
  ('シャープ', 'washing_machine', 'ES-KS70K'),
  ('シャープ', 'washing_machine', 'ES-GE55L'),
  ('シャープ', 'washing_machine', 'ES-GV80M'),
  ('シャープ', 'washing_machine', 'ES-GV90M'),
  ('シャープ', 'washing_machine', 'ES-N75D'),
  ('シャープ', 'washing_machine', 'ES-N7K'),
  ('シャープ', 'washing_machine', 'ES-T55C'),
  ('シャープ', 'washing_machine', 'ES-T730V'),
  ('シャープ', 'washing_machine', 'ES-TG55F'),
  ('シャープ', 'washing_machine', 'ES-TG55G'),
  ('シャープ', 'washing_machine', 'ES-TG55H'),
  ('シャープ', 'washing_machine', 'ES-TG55J'),
  ('シャープ', 'washing_machine', 'ES-TG55K'),
  ('シャープ', 'washing_machine', 'ES-TG55L'),
  ('シャープ', 'washing_machine', 'ES-TX900'),
  ('シャープ', 'washing_machine', 'ES-TX910'),
  ('シャープ', 'washing_machine', 'ES-TX920'),
  ('シャープ', 'washing_machine', 'ES-Y63S'),
  ('シャープ', 'washing_machine', 'ES-YD55S'),
  ('東芝', 'washing_machine', 'AW-10M7'),
  ('東芝', 'washing_machine', 'AW-60DL'),
  ('東芝', 'washing_machine', 'AW-60DM'),
  ('東芝', 'washing_machine', 'AW-60GK'),
  ('東芝', 'washing_machine', 'AW-60GL'),
  ('東芝', 'washing_machine', 'AW-60GM'),
  ('東芝', 'washing_machine', 'AW-60SDF'),
  ('東芝', 'washing_machine', 'AW-6G2'),
  ('東芝', 'washing_machine', 'AW-70DJE7'),
  ('東芝', 'washing_machine', 'AW-70DKE8'),
  ('東芝', 'washing_machine', 'AW-70DLE9'),
  ('東芝', 'washing_machine', 'AW-70GL'),
  ('東芝', 'washing_machine', 'AW-70GM'),
  ('東芝', 'washing_machine', 'AW-7G2'),
  ('東芝', 'washing_machine', 'AW-80DJE7'),
  ('東芝', 'washing_machine', 'AW-80DKE8'),
  ('東芝', 'washing_machine', 'AW-80DLE9'),
  ('東芝', 'washing_machine', 'AW-80VL'),
  ('東芝', 'washing_machine', 'AW-80VLE9'),
  ('東芝', 'washing_machine', 'AW-90SVL'),
  ('東芝', 'washing_machine', 'AW-10SD8'),
  ('東芝', 'washing_machine', 'AW-12VP2'),
  ('東芝', 'washing_machine', 'AW-12VP3'),
  ('東芝', 'washing_machine', 'AW-60GC'),
  ('東芝', 'washing_machine', 'AW-60GF'),
  ('東芝', 'washing_machine', 'AW-70GC'),
  ('東芝', 'washing_machine', 'AW-70VE'),
  ('東芝', 'washing_machine', 'AW-80DB'),
  ('東芝', 'washing_machine', 'AW-80VA'),
  ('東芝', 'washing_machine', 'AW-80VE'),
  ('東芝', 'washing_machine', 'AW-8D9'),
  ('東芝', 'washing_machine', 'AW-8V5'),
  ('東芝', 'washing_machine', 'AW-8V6'),
  ('東芝', 'washing_machine', 'AW-8V7'),
  ('東芝', 'washing_machine', 'AW-8V8'),
  ('東芝', 'washing_machine', 'AW-8V9'),
  ('東芝', 'washing_machine', 'AW-8VE6'),
  ('東芝', 'washing_machine', 'AW-95JD'),
  ('東芝', 'washing_machine', 'AW-9V5'),
  ('東芝', 'washing_machine', 'AW-9V6'),
  ('東芝', 'washing_machine', 'AW-9V7'),
  ('東芝', 'washing_machine', 'AW-9VE6'),
  ('ダイソン', 'vacuum', 'V6 Absolute'),
  ('ダイキン', 'air_conditioner', 'AN28VESK-W'),
  ('ダイキン', 'air_conditioner', 'AN28VES-W'),
  ('ダイキン', 'air_conditioner', 'AN28WEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN28WESK-W'),
  ('ダイキン', 'air_conditioner', 'AN28WES-W'),
  ('ダイキン', 'air_conditioner', 'AN28XEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN28XESK-W'),
  ('ダイキン', 'air_conditioner', 'AN28YEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN28YESK-W'),
  ('ダイキン', 'air_conditioner', 'AN28YES-W'),
  ('ダイキン', 'air_conditioner', 'AN28ZEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN28ZESK-W'),
  ('ダイキン', 'air_conditioner', 'AN28ZES-W'),
  ('ダイキン', 'air_conditioner', 'AN363AES-W'),
  ('ダイキン', 'air_conditioner', 'AN36REBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36RESK-W'),
  ('ダイキン', 'air_conditioner', 'AN36RES-W'),
  ('ダイキン', 'air_conditioner', 'AN36SEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36SESK-W'),
  ('ダイキン', 'air_conditioner', 'AN36SES-W'),
  ('ダイキン', 'air_conditioner', 'AN36TEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36TESK-W'),
  ('ダイキン', 'air_conditioner', 'AN36TES-W'),
  ('ダイキン', 'air_conditioner', 'AN36UEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36UESK-W'),
  ('ダイキン', 'air_conditioner', 'AN36UES-W'),
  ('ダイキン', 'air_conditioner', 'AN36VEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36VESK-W'),
  ('ダイキン', 'air_conditioner', 'AN36VES-W'),
  ('ダイキン', 'air_conditioner', 'AN36WEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36WESK-W'),
  ('ダイキン', 'air_conditioner', 'AN36WES-W'),
  ('ダイキン', 'air_conditioner', 'AN36XEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36XES-W'),
  ('ダイキン', 'air_conditioner', 'AN36YEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36YESK-W'),
  ('ダイキン', 'air_conditioner', 'AN36YES-W'),
  ('ダイキン', 'air_conditioner', 'AN36ZEBKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36ZESK-W'),
  ('ダイキン', 'air_conditioner', 'AN36ZES-W'),
  ('ダイキン', 'air_conditioner', 'AN403AEP-W'),
  ('ダイキン', 'air_conditioner', 'AN40REBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40REPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40REP-W'),
  ('ダイキン', 'air_conditioner', 'AN40RNP-W'),
  ('ダイキン', 'air_conditioner', 'AN40SEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40SEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40SEP-W'),
  ('ダイキン', 'air_conditioner', 'AN40TEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40TEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40TEP-W')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('ダイキン', 'air_conditioner', 'AN40UEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40UEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40UEP-W'),
  ('ダイキン', 'air_conditioner', 'AN40VEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40VEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40VEP-W'),
  ('ダイキン', 'air_conditioner', 'AN40WEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40WEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40WEP-W'),
  ('ダイキン', 'air_conditioner', 'AN40XEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40XEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40XEP-W'),
  ('ダイキン', 'air_conditioner', 'AN40YEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40YEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40ZEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40ZEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40ZEP-W'),
  ('ダイキン', 'air_conditioner', 'AN563AEP-W'),
  ('ダイキン', 'air_conditioner', 'AN56REBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56REPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56REP-W'),
  ('ダイキン', 'air_conditioner', 'AN56SEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56SEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56SEP-W'),
  ('ダイキン', 'air_conditioner', 'AN56TEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56TEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56TEP-W'),
  ('ダイキン', 'air_conditioner', 'AN56UEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56UEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56UEP-W'),
  ('ダイキン', 'air_conditioner', 'AN56VEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56VEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56WEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56WEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56WEP-W'),
  ('ダイキン', 'air_conditioner', 'AN56XEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56XEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56XEP-W'),
  ('ダイキン', 'air_conditioner', 'AN56YEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56YEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56YEP-W'),
  ('ダイキン', 'air_conditioner', 'AN56ZEBKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56ZEPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56ZEP-W'),
  ('日立', 'air_conditioner', 'RAS-A22C'),
  ('日立', 'air_conditioner', 'RAS-A22E'),
  ('日立', 'air_conditioner', 'RAS-A25Z'),
  ('日立', 'air_conditioner', 'RAS-A28C'),
  ('日立', 'air_conditioner', 'RAS-A28E'),
  ('日立', 'air_conditioner', 'RAS-A28Z'),
  ('日立', 'air_conditioner', 'RAS-AJ22A'),
  ('日立', 'air_conditioner', 'RAS-AJ22AE'),
  ('日立', 'air_conditioner', 'RAS-AJ22B'),
  ('日立', 'air_conditioner', 'RAS-AJ22BE'),
  ('日立', 'air_conditioner', 'RAS-AJ22BG'),
  ('日立', 'air_conditioner', 'RAS-AJ22C'),
  ('日立', 'air_conditioner', 'RAS-AJ22CE'),
  ('日立', 'air_conditioner', 'RAS-AJ22CG'),
  ('日立', 'air_conditioner', 'RAS-AJ22D'),
  ('日立', 'air_conditioner', 'RAS-AJ22DE'),
  ('日立', 'air_conditioner', 'RAS-AJ22DG'),
  ('日立', 'air_conditioner', 'RAS-AJ22FE'),
  ('日立', 'air_conditioner', 'RAS-AJ22FG'),
  ('日立', 'air_conditioner', 'RAS-AJ22Z'),
  ('日立', 'air_conditioner', 'RAS-AJ25A'),
  ('日立', 'air_conditioner', 'RAS-AJ25AE'),
  ('日立', 'air_conditioner', 'RAS-AJ25B'),
  ('日立', 'air_conditioner', 'RAS-AJ25BE'),
  ('日立', 'air_conditioner', 'RAS-AJ25BG'),
  ('日立', 'air_conditioner', 'RAS-AJ25C'),
  ('日立', 'air_conditioner', 'RAS-AJ25CE'),
  ('日立', 'air_conditioner', 'RAS-AJ25CG'),
  ('日立', 'air_conditioner', 'RAS-AJ25D'),
  ('日立', 'air_conditioner', 'RAS-AJ25DE'),
  ('日立', 'air_conditioner', 'RAS-AJ25DG'),
  ('日立', 'air_conditioner', 'RAS-AJ25E'),
  ('日立', 'air_conditioner', 'RAS-AJ25EE'),
  ('日立', 'air_conditioner', 'RAS-AJ25EG'),
  ('日立', 'air_conditioner', 'RAS-AJ25F'),
  ('日立', 'air_conditioner', 'RAS-AJ25FE'),
  ('日立', 'air_conditioner', 'RAS-AJ25FG'),
  ('日立', 'air_conditioner', 'RAS-AJ25Z'),
  ('日立', 'air_conditioner', 'RAS-AJ28A'),
  ('日立', 'air_conditioner', 'RAS-AJ28AE'),
  ('日立', 'air_conditioner', 'RAS-AJ28B'),
  ('日立', 'air_conditioner', 'RAS-AJ28BE'),
  ('日立', 'air_conditioner', 'RAS-AJ28BG'),
  ('日立', 'air_conditioner', 'RAS-AJ28C'),
  ('日立', 'air_conditioner', 'RAS-AJ28CE'),
  ('日立', 'air_conditioner', 'RAS-AJ28CG'),
  ('日立', 'air_conditioner', 'RAS-AJ28D'),
  ('日立', 'air_conditioner', 'RAS-AJ28DE'),
  ('日立', 'air_conditioner', 'RAS-AJ28DG'),
  ('日立', 'air_conditioner', 'RAS-AJ28F'),
  ('日立', 'air_conditioner', 'RAS-AJ28FE'),
  ('日立', 'air_conditioner', 'RAS-AJ28FG'),
  ('日立', 'air_conditioner', 'RAS-AJ28Z'),
  ('日立', 'air_conditioner', 'RAS-AJ36A'),
  ('日立', 'air_conditioner', 'RAS-AJ36AE'),
  ('日立', 'air_conditioner', 'RAS-AJ36B'),
  ('日立', 'air_conditioner', 'RAS-AJ36BE'),
  ('日立', 'air_conditioner', 'RAS-AJ36BG'),
  ('日立', 'air_conditioner', 'RAS-AJ36C'),
  ('日立', 'air_conditioner', 'RAS-AJ36CE'),
  ('日立', 'air_conditioner', 'RAS-AJ36CG'),
  ('日立', 'air_conditioner', 'RAS-AJ36D'),
  ('日立', 'air_conditioner', 'RAS-AJ36DE'),
  ('日立', 'air_conditioner', 'RAS-AJ36DG'),
  ('日立', 'air_conditioner', 'RAS-AJ36F'),
  ('日立', 'air_conditioner', 'RAS-AJ36FE'),
  ('日立', 'air_conditioner', 'RAS-AJ36FG'),
  ('日立', 'air_conditioner', 'RAS-AJ36Z'),
  ('日立', 'air_conditioner', 'RAS-AJ40F'),
  ('日立', 'air_conditioner', 'RAS-AJ40G'),
  ('日立', 'air_conditioner', 'RAS-AJN22A'),
  ('日立', 'air_conditioner', 'RAS-AJN22D'),
  ('日立', 'air_conditioner', 'RAS-AJN25A'),
  ('日立', 'air_conditioner', 'RAS-AJN25D'),
  ('日立', 'air_conditioner', 'RAS-AJN28A'),
  ('日立', 'air_conditioner', 'RAS-AJN28D'),
  ('日立', 'air_conditioner', 'RAS-AJN36A'),
  ('日立', 'air_conditioner', 'RAS-AJN36D'),
  ('日立', 'air_conditioner', 'RAS-AN22C'),
  ('日立', 'air_conditioner', 'RAS-AN28C'),
  ('日立', 'air_conditioner', 'RAS-AS22A'),
  ('日立', 'air_conditioner', 'RAS-AS22B'),
  ('日立', 'air_conditioner', 'RAS-AS22C'),
  ('日立', 'air_conditioner', 'RAS-AS25A'),
  ('日立', 'air_conditioner', 'RAS-AS25B'),
  ('日立', 'air_conditioner', 'RAS-AS25C'),
  ('日立', 'air_conditioner', 'RAS-AS28A'),
  ('日立', 'air_conditioner', 'RAS-AS28B'),
  ('日立', 'air_conditioner', 'RAS-AS28C'),
  ('日立', 'air_conditioner', 'RAS-ASN22B'),
  ('日立', 'air_conditioner', 'RAS-AT22B'),
  ('日立', 'air_conditioner', 'RAS-AT25B'),
  ('日立', 'air_conditioner', 'RAS-AT28B'),
  ('日立', 'air_conditioner', 'RAS-AW22C'),
  ('日立', 'air_conditioner', 'RAS-AW22D'),
  ('日立', 'air_conditioner', 'RAS-AW22E'),
  ('日立', 'air_conditioner', 'RAS-AW25C'),
  ('日立', 'air_conditioner', 'RAS-AW25D'),
  ('日立', 'air_conditioner', 'RAS-AW25E'),
  ('日立', 'air_conditioner', 'RAS-AW28C'),
  ('日立', 'air_conditioner', 'RAS-AW28D'),
  ('日立', 'air_conditioner', 'RAS-AW28E'),
  ('日立', 'air_conditioner', 'RAS-BJ22D'),
  ('日立', 'air_conditioner', 'RAS-BJ25D'),
  ('日立', 'air_conditioner', 'RAS-BJ28D'),
  ('日立', 'air_conditioner', 'RAS-BJ36D'),
  ('日立', 'air_conditioner', 'RAS-D22D'),
  ('日立', 'air_conditioner', 'RAS-D22F'),
  ('日立', 'air_conditioner', 'RAS-D25D'),
  ('日立', 'air_conditioner', 'RAS-D25F'),
  ('日立', 'air_conditioner', 'RAS-D28D'),
  ('日立', 'air_conditioner', 'RAS-D28F'),
  ('日立', 'air_conditioner', 'RAS-DT22C'),
  ('日立', 'air_conditioner', 'RAS-DT25C'),
  ('日立', 'air_conditioner', 'RAS-DT28C'),
  ('日立', 'air_conditioner', 'RAS-F220Y'),
  ('日立', 'air_conditioner', 'RAS-F22C'),
  ('日立', 'air_conditioner', 'RAS-F22E'),
  ('日立', 'air_conditioner', 'RAS-F25E'),
  ('日立', 'air_conditioner', 'RAS-F28C'),
  ('日立', 'air_conditioner', 'RAS-F28E'),
  ('日立', 'air_conditioner', 'RAS-F36E'),
  ('日立', 'air_conditioner', 'RAS-KJ22A'),
  ('日立', 'air_conditioner', 'RAS-KJ22B'),
  ('日立', 'air_conditioner', 'RAS-KJ22C'),
  ('日立', 'air_conditioner', 'RAS-KJ22D'),
  ('日立', 'air_conditioner', 'RAS-KJ22F'),
  ('日立', 'air_conditioner', 'RAS-KJ22Z'),
  ('日立', 'air_conditioner', 'RAS-KJ25A'),
  ('日立', 'air_conditioner', 'RAS-KJ25B'),
  ('日立', 'air_conditioner', 'RAS-KJ25C'),
  ('日立', 'air_conditioner', 'RAS-KJ25D'),
  ('日立', 'air_conditioner', 'RAS-KJ25F'),
  ('日立', 'air_conditioner', 'RAS-KJ25Z'),
  ('日立', 'air_conditioner', 'RAS-KJ28A'),
  ('日立', 'air_conditioner', 'RAS-KJ28B'),
  ('日立', 'air_conditioner', 'RAS-KJ28C'),
  ('日立', 'air_conditioner', 'RAS-KJ28D'),
  ('日立', 'air_conditioner', 'RAS-KJ28F'),
  ('日立', 'air_conditioner', 'RAS-KJ28Z'),
  ('日立', 'air_conditioner', 'RAS-KJ36A'),
  ('日立', 'air_conditioner', 'RAS-KJ36B'),
  ('日立', 'air_conditioner', 'RAS-KJ36C'),
  ('日立', 'air_conditioner', 'RAS-KJ36D'),
  ('日立', 'air_conditioner', 'RAS-KJ36F'),
  ('日立', 'air_conditioner', 'RAS-KJ36Z'),
  ('日立', 'air_conditioner', 'RAS-R22A'),
  ('日立', 'air_conditioner', 'RAS-R22B'),
  ('日立', 'air_conditioner', 'RAS-R22C'),
  ('日立', 'air_conditioner', 'RAS-R22Z'),
  ('日立', 'air_conditioner', 'RAS-R28A'),
  ('日立', 'air_conditioner', 'RAS-R28B'),
  ('日立', 'air_conditioner', 'RAS-R28C'),
  ('日立', 'air_conditioner', 'RAS-R28Z'),
  ('日立', 'air_conditioner', 'RAS-RN22Z'),
  ('日立', 'air_conditioner', 'RAS-RN28Z')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('日立', 'air_conditioner', 'RAS-VJ2526S'),
  ('日立', 'air_conditioner', 'RAS-VL7126D'),
  ('日立', 'air_conditioner', 'RAS-XJ2226S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV2216'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV2217'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV225'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV2516'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV2517'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV255'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV2816'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV2817'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV285'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV3616'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV3617'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV365'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV4016S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV4017S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV405S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV5616S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV5617S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV565S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV2518E'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW280'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV2219'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV2519'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV2819S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV3619S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV4019S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2219'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2519'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD3619S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD4019S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD5619S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD6319S'),
  ('三菱電機', 'air_conditioner', 'MSZ-L2218'),
  ('三菱電機', 'air_conditioner', 'MSZ-L2518'),
  ('三菱電機', 'air_conditioner', 'MSZ-L2818'),
  ('三菱電機', 'air_conditioner', 'MSZ-L3618'),
  ('三菱電機', 'air_conditioner', 'MSZ-L4018S'),
  ('三菱電機', 'air_conditioner', 'MSZ-L5618S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV404S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV634S'),
  ('三菱電機', 'air_conditioner', 'MSZ-X2216'),
  ('三菱電機', 'air_conditioner', 'MSZ-X225'),
  ('三菱電機', 'air_conditioner', 'MSZ-X2516'),
  ('三菱電機', 'air_conditioner', 'MSZ-X255'),
  ('三菱電機', 'air_conditioner', 'MSZ-X2816'),
  ('三菱電機', 'air_conditioner', 'MSZ-X285'),
  ('三菱電機', 'air_conditioner', 'MSZ-X3616'),
  ('三菱電機', 'air_conditioner', 'MSZ-X365'),
  ('三菱電機', 'air_conditioner', 'MSZ-X4016S'),
  ('三菱電機', 'air_conditioner', 'MSZ-X405S'),
  ('三菱電機', 'air_conditioner', 'MSZ-X5616S'),
  ('三菱電機', 'air_conditioner', 'MSZ-X565S'),
  ('三菱電機', 'air_conditioner', 'MSZ-X6316S'),
  ('三菱電機', 'air_conditioner', 'MSZ-X7116S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW223'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW283'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW363'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW633S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW634S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV713S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV259'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV287S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV289S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV407S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV409S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV509S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV228'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV229'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV258'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV259'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV288'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV288S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV289'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV289S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV368'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV368S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV369'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV369S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV408S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV409S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV508S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV509S'),
  ('三菱電機', 'air_conditioner', 'MSZ-SW227'),
  ('三菱電機', 'air_conditioner', 'MSZ-SW257'),
  ('三菱電機', 'air_conditioner', 'MSZ-SW287'),
  ('三菱電機', 'air_conditioner', 'MSZ-SW367'),
  ('三菱電機', 'air_conditioner', 'MSZ-SW507S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW228'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW257'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW258'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW287'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW367'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW368'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW407S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW408S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW507S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW508S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW637S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW718S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV227'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV228'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV257'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV258'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV287'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV287S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV288'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV288S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV367'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV367S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV368'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV368S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV407S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV507S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV508S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV637S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV638S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV718S'),
  ('Panasonic', 'refrigerator', 'NR-ETF433'),
  ('Panasonic', 'refrigerator', 'NR-F504T'),
  ('Panasonic', 'refrigerator', 'NR-E436TL'),
  ('Panasonic', 'refrigerator', 'NR-F478XGM'),
  ('Panasonic', 'refrigerator', 'NR-F518TV'),
  ('Panasonic', 'refrigerator', 'NR-E416V'),
  ('Panasonic', 'refrigerator', 'NR-E416VL'),
  ('Panasonic', 'refrigerator', 'NR-E417EX'),
  ('Panasonic', 'refrigerator', 'NR-E417EXL'),
  ('Panasonic', 'refrigerator', 'NR-F502XPV'),
  ('Panasonic', 'refrigerator', 'NR-F504GV'),
  ('Panasonic', 'refrigerator', 'NR-F505XPV'),
  ('Panasonic', 'refrigerator', 'NR-F554HPX'),
  ('Panasonic', 'refrigerator', 'NR-F557HPX'),
  ('Panasonic', 'refrigerator', 'NR-FVF504'),
  ('Panasonic', 'refrigerator', 'NR-FVF505'),
  ('Panasonic', 'refrigerator', 'NR-FVM470S'),
  ('Panasonic', 'refrigerator', 'NR-F560PV'),
  ('Panasonic', 'refrigerator', 'NR-F553HPX'),
  ('Panasonic', 'refrigerator', 'NR-E471TL'),
  ('Panasonic', 'refrigerator', 'NR-E471T'),
  ('Panasonic', 'refrigerator', 'NR-E450T'),
  ('Panasonic', 'refrigerator', 'NR-B146W'),
  ('Panasonic', 'refrigerator', 'NR-B145W'),
  ('Panasonic', 'refrigerator', 'NR-B144W'),
  ('Panasonic', 'refrigerator', 'NR-B175W'),
  ('Panasonic', 'refrigerator', 'NR-F401A'),
  ('Panasonic', 'refrigerator', 'NR-F456T'),
  ('日立', 'refrigerator', 'R-CW5200'),
  ('日立', 'refrigerator', 'R-S4200D'),
  ('三菱電機', 'refrigerator', 'MR-BX52W'),
  ('三菱電機', 'refrigerator', 'MR-R47W'),
  ('三菱電機', 'refrigerator', 'MR-R47X'),
  ('三菱電機', 'refrigerator', 'MR-R52T'),
  ('三菱電機', 'refrigerator', 'MR-R52W'),
  ('三菱電機', 'refrigerator', 'MR-B46A'),
  ('三菱電機', 'refrigerator', 'MR-B46C'),
  ('三菱電機', 'refrigerator', 'MR-MX46G'),
  ('三菱電機', 'refrigerator', 'MR-R46E'),
  ('三菱電機', 'refrigerator', 'MR-R46F'),
  ('三菱電機', 'refrigerator', 'MR-WX47E'),
  ('三菱電機', 'refrigerator', 'MR-WX52E'),
  ('三菱電機', 'refrigerator', 'MR-WX52H'),
  ('三菱電機', 'refrigerator', 'MR-WX60E'),
  ('三菱電機', 'refrigerator', 'MR-MB45H'),
  ('東芝', 'refrigerator', 'GR-K50FR'),
  ('東芝', 'refrigerator', 'GR-M50FP'),
  ('東芝', 'refrigerator', 'GR-M50FX'),
  ('Panasonic', 'washing_machine', 'NA-F60PB8'),
  ('Panasonic', 'washing_machine', 'NA-F70PB8'),
  ('Panasonic', 'washing_machine', 'NA-FA80H1'),
  ('Panasonic', 'washing_machine', 'NA-VG1200R'),
  ('Panasonic', 'washing_machine', 'NA-VG2200L'),
  ('Panasonic', 'washing_machine', 'NA-VG2200R'),
  ('Panasonic', 'washing_machine', 'NA-VX3800L'),
  ('Panasonic', 'washing_machine', 'NA-VX7900L'),
  ('Panasonic', 'washing_machine', 'NA-VX7900R'),
  ('Panasonic', 'washing_machine', 'NA-VX9600'),
  ('Panasonic', 'washing_machine', 'NA-VX3500L'),
  ('日立', 'washing_machine', 'BW-DBK100F'),
  ('日立', 'washing_machine', 'BW-DX100F'),
  ('日立', 'washing_machine', 'BW-DX90F'),
  ('日立', 'washing_machine', 'BW-KSV100C'),
  ('日立', 'washing_machine', 'BW-KSV100E'),
  ('日立', 'washing_machine', 'BW-T805'),
  ('日立', 'washing_machine', 'BW-T806'),
  ('日立', 'washing_machine', 'BW-V100C'),
  ('日立', 'washing_machine', 'BW-V100CJ'),
  ('日立', 'washing_machine', 'BW-V100E'),
  ('日立', 'washing_machine', 'BW-V70C'),
  ('日立', 'washing_machine', 'BW-V70E'),
  ('日立', 'washing_machine', 'BW-V80C'),
  ('日立', 'washing_machine', 'BW-V80E'),
  ('日立', 'washing_machine', 'BW-V90C'),
  ('日立', 'washing_machine', 'BW-V90E'),
  ('日立', 'washing_machine', 'BW-DV80G'),
  ('日立', 'washing_machine', 'BW-X100H'),
  ('日立', 'washing_machine', 'BW-X90H'),
  ('日立', 'washing_machine', 'BW-V80H'),
  ('日立', 'washing_machine', 'BW-V70H'),
  ('シャープ', 'washing_machine', 'ES-A70C')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('シャープ', 'washing_machine', 'ES-A70H'),
  ('シャープ', 'washing_machine', 'ES-A80C'),
  ('シャープ', 'washing_machine', 'ES-A80H'),
  ('シャープ', 'washing_machine', 'ES-BG552'),
  ('シャープ', 'washing_machine', 'ES-BG553'),
  ('シャープ', 'washing_machine', 'ES-D7C'),
  ('シャープ', 'washing_machine', 'ES-DD8C'),
  ('シャープ', 'washing_machine', 'ES-F556'),
  ('シャープ', 'washing_machine', 'ES-A210'),
  ('シャープ', 'washing_machine', 'ES-W112'),
  ('シャープ', 'washing_machine', 'ES-W114'),
  ('シャープ', 'washing_machine', 'ES-ZP1'),
  ('シャープ', 'washing_machine', 'ES-KS70L'),
  ('シャープ', 'washing_machine', 'ES-GV8'),
  ('シャープ', 'washing_machine', 'ES-GV80'),
  ('シャープ', 'washing_machine', 'ES-GV9'),
  ('シャープ', 'washing_machine', 'ES-GV90'),
  ('シャープ', 'washing_machine', 'ES-KS70'),
  ('シャープ', 'washing_machine', 'ES-TX8'),
  ('東芝', 'washing_machine', 'AW-50GL'),
  ('東芝', 'washing_machine', 'AW-50GLC'),
  ('東芝', 'washing_machine', 'AW-6G5'),
  ('東芝', 'washing_machine', 'AW-6G6'),
  ('東芝', 'washing_machine', 'AW-6G8'),
  ('東芝', 'washing_machine', 'AW-6G9'),
  ('東芝', 'washing_machine', 'AW-6GM1'),
  ('東芝', 'washing_machine', 'AW-7G5'),
  ('東芝', 'washing_machine', 'AW-7G6'),
  ('東芝', 'washing_machine', 'AW-7G8'),
  ('東芝', 'washing_machine', 'AW-7G9'),
  ('東芝', 'washing_machine', 'AW-7GM1'),
  ('東芝', 'washing_machine', 'AW-7GME1'),
  ('東芝', 'washing_machine', 'AW-90GF'),
  ('東芝', 'washing_machine', 'AW-90SDL'),
  ('東芝', 'washing_machine', 'AW-10SVE4'),
  ('東芝', 'washing_machine', 'AW-10SVE5'),
  ('東芝', 'washing_machine', 'AW-10SVE6'),
  ('東芝', 'washing_machine', 'AW-502V'),
  ('東芝', 'washing_machine', 'AW-602GP'),
  ('東芝', 'washing_machine', 'AW-602VP'),
  ('東芝', 'washing_machine', 'AW-603GP'),
  ('東芝', 'washing_machine', 'AW-604GP'),
  ('東芝', 'washing_machine', 'AW-60GA'),
  ('東芝', 'washing_machine', 'AW-60SDC'),
  ('東芝', 'washing_machine', 'AW-701GP'),
  ('東芝', 'washing_machine', 'AW-702GP'),
  ('東芝', 'washing_machine', 'AW-703GP'),
  ('東芝', 'washing_machine', 'AW-704GP'),
  ('東芝', 'washing_machine', 'AW-70DA'),
  ('東芝', 'washing_machine', 'AW-70GA'),
  ('東芝', 'washing_machine', 'AW-70GF'),
  ('東芝', 'washing_machine', 'AW-70GK'),
  ('東芝', 'washing_machine', 'AW-70VA'),
  ('東芝', 'washing_machine', 'AW-70VAV7'),
  ('東芝', 'washing_machine', 'AW-70VBE2'),
  ('東芝', 'washing_machine', 'AW-75VCE3'),
  ('東芝', 'washing_machine', 'AW-7D5'),
  ('東芝', 'washing_machine', 'AW-7D6'),
  ('東芝', 'washing_machine', 'AW-7D7'),
  ('東芝', 'washing_machine', 'AW-7D8'),
  ('東芝', 'washing_machine', 'AW-7D9'),
  ('東芝', 'washing_machine', 'AW-7DE4'),
  ('東芝', 'washing_machine', 'AW-80DA'),
  ('東芝', 'washing_machine', 'AW-80VAV7'),
  ('東芝', 'washing_machine', 'AW-80VBE2'),
  ('東芝', 'washing_machine', 'AW-830JDM'),
  ('東芝', 'washing_machine', 'AW-8D5'),
  ('東芝', 'washing_machine', 'AW-8D6'),
  ('東芝', 'washing_machine', 'AW-8D7'),
  ('東芝', 'washing_machine', 'AW-8D8'),
  ('東芝', 'washing_machine', 'AW-8DE4'),
  ('東芝', 'washing_machine', 'AW-8DH1'),
  ('東芝', 'washing_machine', 'AW-9DH1'),
  ('東芝', 'washing_machine', 'AW-9SD5'),
  ('東芝', 'washing_machine', 'AW-9SV5'),
  ('東芝', 'washing_machine', 'AW-9SV6'),
  ('東芝', 'washing_machine', 'AW-9SV7'),
  ('東芝', 'washing_machine', 'AW-9SV8'),
  ('東芝', 'washing_machine', 'AW-9SV9'),
  ('東芝', 'washing_machine', 'AW-9SVE4'),
  ('東芝', 'washing_machine', 'AW-9SVE5'),
  ('東芝', 'washing_machine', 'AW-9VH1'),
  ('Panasonic', 'air_conditioner', 'CS-HX285C'),
  ('Panasonic', 'air_conditioner', 'CS-X225C'),
  ('Panasonic', 'air_conditioner', 'CS-X285C'),
  ('Panasonic', 'air_conditioner', 'CS-HX635C2'),
  ('Panasonic', 'air_conditioner', 'CS-HX715C2'),
  ('Panasonic', 'air_conditioner', 'CS-X565C2'),
  ('Panasonic', 'air_conditioner', 'CS-X405C2'),
  ('Panasonic', 'air_conditioner', 'CS-F565C2'),
  ('Panasonic', 'air_conditioner', 'CS-X805C2'),
  ('Panasonic', 'air_conditioner', 'CS-X635C2'),
  ('Panasonic', 'air_conditioner', 'CS-X715C2'),
  ('Panasonic', 'air_conditioner', 'CS-HX565C2'),
  ('Panasonic', 'air_conditioner', 'CS-HX405C2'),
  ('Panasonic', 'air_conditioner', 'CS-HX805C2'),
  ('Panasonic', 'air_conditioner', 'CS-X560D2'),
  ('Panasonic', 'air_conditioner', 'CS-X220D'),
  ('Panasonic', 'air_conditioner', 'CS-X710D2'),
  ('Panasonic', 'air_conditioner', 'CS-X400D2'),
  ('Panasonic', 'air_conditioner', 'CS-XS630D2'),
  ('Panasonic', 'air_conditioner', 'CS-X800D2'),
  ('Panasonic', 'air_conditioner', 'CS-X400D'),
  ('Panasonic', 'air_conditioner', 'CS-XS280D'),
  ('Panasonic', 'air_conditioner', 'CS-X250D'),
  ('Panasonic', 'air_conditioner', 'CS-X630D2'),
  ('Panasonic', 'air_conditioner', 'CS-X360D'),
  ('ダイキン', 'air_conditioner', 'AN28XES-W'),
  ('ダイキン', 'air_conditioner', 'AN36XESK-W'),
  ('日立', 'air_conditioner', 'RAS-A22D'),
  ('日立', 'air_conditioner', 'RAS-A28D'),
  ('日立', 'air_conditioner', 'RAS-AJ22E'),
  ('日立', 'air_conditioner', 'RAS-AJ22EE'),
  ('日立', 'air_conditioner', 'RAS-AJ22EG'),
  ('日立', 'air_conditioner', 'RAS-AJ28E'),
  ('日立', 'air_conditioner', 'RAS-AJ28EE'),
  ('日立', 'air_conditioner', 'RAS-AJ28EG'),
  ('日立', 'air_conditioner', 'RAS-AJ36E'),
  ('日立', 'air_conditioner', 'RAS-AJ36EE'),
  ('日立', 'air_conditioner', 'RAS-AJ36EG'),
  ('日立', 'air_conditioner', 'RAS-D22E'),
  ('日立', 'air_conditioner', 'RAS-D25E'),
  ('日立', 'air_conditioner', 'RAS-D28E'),
  ('日立', 'air_conditioner', 'RAS-F22D'),
  ('日立', 'air_conditioner', 'RAS-F25D'),
  ('日立', 'air_conditioner', 'RAS-F28D'),
  ('日立', 'air_conditioner', 'RAS-F36D'),
  ('日立', 'air_conditioner', 'RAS-KJ22E'),
  ('日立', 'air_conditioner', 'RAS-KJ25E'),
  ('日立', 'air_conditioner', 'RAS-KJ28E'),
  ('日立', 'air_conditioner', 'RAS-KJ36E'),
  ('日立', 'air_conditioner', 'RAS-X36L'),
  ('日立', 'air_conditioner', 'RAS-XR4026D'),
  ('日立', 'air_conditioner', 'RAS-XR2826S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV255'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV285S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV405S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV565S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV635S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV400S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZD634S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW404S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV507S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW288'),
  ('Panasonic', 'refrigerator', 'NR-E401TL'),
  ('Panasonic', 'refrigerator', 'NR-FTM476S'),
  ('Panasonic', 'refrigerator', 'NR-ETR435'),
  ('Panasonic', 'refrigerator', 'NR-F600XV'),
  ('Panasonic', 'refrigerator', 'NR-E433T'),
  ('Panasonic', 'refrigerator', 'NR-F473TM'),
  ('Panasonic', 'refrigerator', 'NR-F474TM'),
  ('Panasonic', 'refrigerator', 'NR-F475TM'),
  ('Panasonic', 'refrigerator', 'NR-F503T'),
  ('Panasonic', 'refrigerator', 'NR-F551XV'),
  ('Panasonic', 'refrigerator', 'NR-F553T'),
  ('Panasonic', 'refrigerator', 'NR-F554T'),
  ('Panasonic', 'refrigerator', 'NR-F555T'),
  ('Panasonic', 'refrigerator', 'NR-J55CC'),
  ('Panasonic', 'refrigerator', 'NR-F568TV'),
  ('Panasonic', 'refrigerator', 'NR-E414GVL'),
  ('Panasonic', 'refrigerator', 'NR-F516MEX'),
  ('Panasonic', 'refrigerator', 'NR-F555WPX'),
  ('Panasonic', 'refrigerator', 'NR-F559HPX'),
  ('Panasonic', 'refrigerator', 'NR-F604HPX'),
  ('Panasonic', 'refrigerator', 'NR-F609HPX'),
  ('Panasonic', 'refrigerator', 'NR-F672XPV'),
  ('Panasonic', 'refrigerator', 'NR-F602XPV'),
  ('Panasonic', 'refrigerator', 'NR-F503HPX'),
  ('Panasonic', 'refrigerator', 'NR-F603HPX'),
  ('Panasonic', 'refrigerator', 'NR-F473XPV'),
  ('Panasonic', 'refrigerator', 'NR-F503XPV'),
  ('Panasonic', 'refrigerator', 'NR-F511PV'),
  ('Panasonic', 'refrigerator', 'NR-F472PV'),
  ('Panasonic', 'refrigerator', 'NR-F457T'),
  ('日立', 'refrigerator', 'R-CS4800E'),
  ('日立', 'refrigerator', 'R-G6700D'),
  ('日立', 'refrigerator', 'R-X7300F'),
  ('日立', 'refrigerator', 'R-XG5600H'),
  ('日立', 'refrigerator', 'R-CX6700'),
  ('日立', 'refrigerator', 'R-V5400'),
  ('日立', 'refrigerator', 'R-W5700'),
  ('日立', 'refrigerator', 'R-X6000'),
  ('日立', 'refrigerator', 'R-Y5400'),
  ('日立', 'refrigerator', 'R-Y6000'),
  ('日立', 'refrigerator', 'R-Z6200'),
  ('三菱電機', 'refrigerator', 'MR-MX46F'),
  ('三菱電機', 'refrigerator', 'MR-MX50G'),
  ('三菱電機', 'refrigerator', 'MR-WX47F'),
  ('三菱電機', 'refrigerator', 'MR-P15Z'),
  ('三菱電機', 'refrigerator', 'MR-P17Z'),
  ('東芝', 'refrigerator', 'GR-M460FWX'),
  ('東芝', 'refrigerator', 'GR-M510FWX'),
  ('東芝', 'refrigerator', 'GR-M550FWX'),
  ('東芝', 'refrigerator', 'GR-M600FWX'),
  ('東芝', 'refrigerator', 'GR-M460FW'),
  ('東芝', 'refrigerator', 'GR-M510FW'),
  ('東芝', 'refrigerator', 'GR-M550FW'),
  ('東芝', 'refrigerator', 'GR-M600FW'),
  ('東芝', 'refrigerator', 'GR-G43GXV'),
  ('東芝', 'refrigerator', 'GR-G43GXVL')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('東芝', 'refrigerator', 'GR-G43GXVE'),
  ('東芝', 'refrigerator', 'GR-G43GXVEL'),
  ('東芝', 'refrigerator', 'GR-G56FXV'),
  ('東芝', 'refrigerator', 'GR-G62FXV'),
  ('東芝', 'refrigerator', 'GR-M460FD'),
  ('東芝', 'refrigerator', 'GR-M510FD'),
  ('東芝', 'refrigerator', 'GR-R460FH'),
  ('東芝', 'refrigerator', 'GR-C42N'),
  ('東芝', 'refrigerator', 'GR-E43F'),
  ('Panasonic', 'washing_machine', 'NA-F503K'),
  ('Panasonic', 'washing_machine', 'NA-F504K'),
  ('Panasonic', 'washing_machine', 'NA-F50B2'),
  ('Panasonic', 'washing_machine', 'NA-F50B3'),
  ('Panasonic', 'washing_machine', 'NA-FS60H7'),
  ('Panasonic', 'washing_machine', 'NA-FA100H3'),
  ('Panasonic', 'washing_machine', 'NA-FA100H5'),
  ('Panasonic', 'washing_machine', 'NA-FA100H6'),
  ('Panasonic', 'washing_machine', 'NA-FA90H1'),
  ('Panasonic', 'washing_machine', 'NA-FW100K7'),
  ('Panasonic', 'washing_machine', 'NA-FW80S1'),
  ('Panasonic', 'washing_machine', 'NA-FW80S2'),
  ('Panasonic', 'washing_machine', 'NA-FW80S3'),
  ('Panasonic', 'washing_machine', 'NA-FW80S5'),
  ('Panasonic', 'washing_machine', 'NA-FW80S6'),
  ('Panasonic', 'washing_machine', 'NA-FW90S1'),
  ('Panasonic', 'washing_machine', 'NA-FW90S2'),
  ('Panasonic', 'washing_machine', 'NA-SVX80BL'),
  ('Panasonic', 'washing_machine', 'NA-SVX80BR'),
  ('Panasonic', 'washing_machine', 'NA-VG1300R'),
  ('Panasonic', 'washing_machine', 'NA-VG1400R'),
  ('Panasonic', 'washing_machine', 'NA-VG2300L'),
  ('Panasonic', 'washing_machine', 'NA-VG2300R'),
  ('Panasonic', 'washing_machine', 'NA-VG2400L'),
  ('Panasonic', 'washing_machine', 'NA-VG2400R'),
  ('Panasonic', 'washing_machine', 'NA-VX5E3'),
  ('Panasonic', 'washing_machine', 'NA-VX700AL'),
  ('Panasonic', 'washing_machine', 'NA-VX700AR'),
  ('Panasonic', 'washing_machine', 'NA-VX700BL'),
  ('Panasonic', 'washing_machine', 'NA-VX800BL'),
  ('Panasonic', 'washing_machine', 'NA-VX800BR'),
  ('Panasonic', 'washing_machine', 'NA-VX860SL'),
  ('Panasonic', 'washing_machine', 'NA-VX860SR'),
  ('Panasonic', 'washing_machine', 'NA-VX9500'),
  ('Panasonic', 'washing_machine', 'NA-VX3300L'),
  ('Panasonic', 'washing_machine', 'NA-VX9300L'),
  ('Panasonic', 'washing_machine', 'NA-VX9300R'),
  ('日立', 'washing_machine', 'BW-DKX120F'),
  ('日立', 'washing_machine', 'BW-X120F'),
  ('日立', 'washing_machine', 'BW-DKX120G'),
  ('日立', 'washing_machine', 'BW-DX120G'),
  ('日立', 'washing_machine', 'BW-X120G'),
  ('シャープ', 'washing_machine', 'ES-LT850'),
  ('シャープ', 'washing_machine', 'ES-P110'),
  ('シャープ', 'washing_machine', 'ES-GE7K'),
  ('シャープ', 'washing_machine', 'ES-Z200'),
  ('シャープ', 'washing_machine', 'ES-Z210'),
  ('シャープ', 'washing_machine', 'ES-R70P'),
  ('シャープ', 'washing_machine', 'ES-T830V'),
  ('シャープ', 'washing_machine', 'ES-TK55J'),
  ('シャープ', 'washing_machine', 'ES-GX8'),
  ('東芝', 'washing_machine', 'AW-45M5'),
  ('東芝', 'washing_machine', 'AW-45M7'),
  ('東芝', 'washing_machine', 'AW-45M9'),
  ('東芝', 'washing_machine', 'AW-6DH1'),
  ('東芝', 'washing_machine', 'AW-7DH1'),
  ('東芝', 'washing_machine', 'AW-50GK'),
  ('東芝', 'washing_machine', 'AW-50GKC'),
  ('東芝', 'washing_machine', 'AW-50GM'),
  ('東芝', 'washing_machine', 'AW-50GMC'),
  ('東芝', 'washing_machine', 'AW-5G2'),
  ('東芝', 'washing_machine', 'AW-5GC2'),
  ('東芝', 'washing_machine', 'AW-6D6'),
  ('東芝', 'washing_machine', 'AW-7G3'),
  ('東芝', 'washing_machine', 'AW-10DP1'),
  ('東芝', 'washing_machine', 'AW-10DP2'),
  ('東芝', 'washing_machine', 'AW-10DP3'),
  ('東芝', 'washing_machine', 'AW-10SD9'),
  ('東芝', 'washing_machine', 'AW-10SDE5'),
  ('東芝', 'washing_machine', 'AW-10SDE6'),
  ('東芝', 'washing_machine', 'AW-10SDE7'),
  ('東芝', 'washing_machine', 'AW-12DP1'),
  ('東芝', 'washing_machine', 'AW-601GP'),
  ('東芝', 'washing_machine', 'AW-701HVP'),
  ('東芝', 'washing_machine', 'AW-70DCE3'),
  ('東芝', 'washing_machine', 'AW-70GE'),
  ('東芝', 'washing_machine', 'AW-801HVP'),
  ('東芝', 'washing_machine', 'AW-802MVP'),
  ('東芝', 'washing_machine', 'AW-80DCE3'),
  ('東芝', 'washing_machine', 'AW-8VM1'),
  ('東芝', 'washing_machine', 'AW-8VM2'),
  ('東芝', 'washing_machine', 'AW-9SD6'),
  ('東芝', 'washing_machine', 'AW-9SD7'),
  ('東芝', 'washing_machine', 'AW-9SDE5'),
  ('東芝', 'washing_machine', 'AW-9SDE6'),
  ('東芝', 'washing_machine', 'AW-700J2'),
  ('東芝', 'washing_machine', 'AW-700Z2'),
  ('東芝', 'washing_machine', 'AW-7GM2'),
  ('東芝', 'washing_machine', 'AW-7DH3'),
  ('東芝', 'washing_machine', 'AW-700J4'),
  ('Panasonic', 'air_conditioner', 'CS-F258C'),
  ('Panasonic', 'air_conditioner', 'CS-F288CZ'),
  ('Panasonic', 'air_conditioner', 'CS-F408C2'),
  ('Panasonic', 'air_conditioner', 'CS-J258C'),
  ('Panasonic', 'air_conditioner', 'CS-J568C2'),
  ('Panasonic', 'air_conditioner', 'CS-AX221D'),
  ('Panasonic', 'air_conditioner', 'CS-AX560D2'),
  ('Panasonic', 'air_conditioner', 'CS-AX401D2'),
  ('Panasonic', 'air_conditioner', 'CS-AX801D2'),
  ('Panasonic', 'air_conditioner', 'CS-TX639C2'),
  ('Panasonic', 'air_conditioner', 'CS-TX288C2'),
  ('Panasonic', 'air_conditioner', 'CS-E259CZ'),
  ('Panasonic', 'air_conditioner', 'CS-TX408C2'),
  ('Panasonic', 'air_conditioner', 'CS-EX226C'),
  ('Panasonic', 'air_conditioner', 'CS-AX568C2'),
  ('Panasonic', 'air_conditioner', 'CS-AX409C2'),
  ('Panasonic', 'air_conditioner', 'CS-AX809C2'),
  ('Panasonic', 'air_conditioner', 'CS-AX229C'),
  ('Panasonic', 'air_conditioner', 'CS-AX639C2'),
  ('Panasonic', 'air_conditioner', 'CS-AX408C2'),
  ('Panasonic', 'air_conditioner', 'CS-AX808C2'),
  ('Panasonic', 'air_conditioner', 'CS-E225CZ'),
  ('Panasonic', 'air_conditioner', 'CS-X365C'),
  ('Panasonic', 'air_conditioner', 'CS-EX405C2'),
  ('Panasonic', 'air_conditioner', 'CS-F285C'),
  ('Panasonic', 'air_conditioner', 'CS-EX225C'),
  ('Panasonic', 'air_conditioner', 'CS-J285C'),
  ('Panasonic', 'air_conditioner', 'CS-E255CZ'),
  ('Panasonic', 'air_conditioner', 'CS-EX635C2'),
  ('Panasonic', 'air_conditioner', 'CS-J405C2'),
  ('Panasonic', 'air_conditioner', 'CS-E285CZ'),
  ('Panasonic', 'air_conditioner', 'CS-GX565C2'),
  ('Panasonic', 'air_conditioner', 'CS-GX225C'),
  ('Panasonic', 'air_conditioner', 'CS-EX255C'),
  ('Panasonic', 'air_conditioner', 'CS-XS225C'),
  ('Panasonic', 'air_conditioner', 'CS-F365C2'),
  ('Panasonic', 'air_conditioner', 'CS-EX365C'),
  ('Panasonic', 'air_conditioner', 'CS-XS365C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS565C2'),
  ('Panasonic', 'air_conditioner', 'CS-HX365C2'),
  ('Panasonic', 'air_conditioner', 'CS-F225C'),
  ('Panasonic', 'air_conditioner', 'CS-GX405C2'),
  ('Panasonic', 'air_conditioner', 'CS-J225C'),
  ('Panasonic', 'air_conditioner', 'CS-GX255C'),
  ('Panasonic', 'air_conditioner', 'CS-XS405C'),
  ('Panasonic', 'air_conditioner', 'CS-F225CZ'),
  ('Panasonic', 'air_conditioner', 'CS-EX285C'),
  ('Panasonic', 'air_conditioner', 'CS-X365C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS255C'),
  ('Panasonic', 'air_conditioner', 'CS-XS715C2'),
  ('Panasonic', 'air_conditioner', 'CS-GX365C'),
  ('Panasonic', 'air_conditioner', 'CS-F405C2'),
  ('Panasonic', 'air_conditioner', 'CS-F255CZ'),
  ('Panasonic', 'air_conditioner', 'CS-XS285C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS365C'),
  ('Panasonic', 'air_conditioner', 'CS-XS405C2'),
  ('Panasonic', 'air_conditioner', 'CS-EX565C2'),
  ('Panasonic', 'air_conditioner', 'CS-XS805C2'),
  ('Panasonic', 'air_conditioner', 'CS-F255C'),
  ('Panasonic', 'air_conditioner', 'CS-F285CZ'),
  ('Panasonic', 'air_conditioner', 'CS-J255C'),
  ('Panasonic', 'air_conditioner', 'CS-GX285C'),
  ('Panasonic', 'air_conditioner', 'CS-X285C2'),
  ('Panasonic', 'air_conditioner', 'CS-X405C'),
  ('Panasonic', 'air_conditioner', 'CS-XS285C'),
  ('Panasonic', 'air_conditioner', 'CS-X255C'),
  ('Panasonic', 'air_conditioner', 'CS-XS635C2'),
  ('Panasonic', 'air_conditioner', 'CS-J365C2'),
  ('Panasonic', 'air_conditioner', 'CS-J565C2'),
  ('Panasonic', 'air_conditioner', 'CS-EX715C2'),
  ('Panasonic', 'air_conditioner', 'CS-WX407C2'),
  ('Panasonic', 'air_conditioner', 'CS-WX567C2'),
  ('Panasonic', 'air_conditioner', 'CS-WX637C2'),
  ('Panasonic', 'air_conditioner', 'CS-WX717C2'),
  ('Panasonic', 'air_conditioner', 'CS-WX807C2'),
  ('Panasonic', 'air_conditioner', 'CS-WX907C2'),
  ('Panasonic', 'air_conditioner', 'CS-X280D'),
  ('Panasonic', 'air_conditioner', 'CS-XS900D2'),
  ('Panasonic', 'air_conditioner', 'CS-XS220D'),
  ('Panasonic', 'air_conditioner', 'CS-X900D2'),
  ('Panasonic', 'air_conditioner', 'CS-XS360D2'),
  ('Panasonic', 'air_conditioner', 'CS-XS560D2'),
  ('ダイキン', 'air_conditioner', 'AN22RAS-W'),
  ('ダイキン', 'air_conditioner', 'AN22RASK-W'),
  ('ダイキン', 'air_conditioner', 'AN22RRS-C'),
  ('ダイキン', 'air_conditioner', 'AN22RRS-W'),
  ('ダイキン', 'air_conditioner', 'AN22SABKS-W'),
  ('ダイキン', 'air_conditioner', 'AN22SAS-W'),
  ('ダイキン', 'air_conditioner', 'AN22SASK-W'),
  ('ダイキン', 'air_conditioner', 'AN22SRS-C'),
  ('ダイキン', 'air_conditioner', 'AN22SRS-W'),
  ('ダイキン', 'air_conditioner', 'AN25RAS-W'),
  ('ダイキン', 'air_conditioner', 'AN25RASK-W'),
  ('ダイキン', 'air_conditioner', 'AN25RRS-C'),
  ('ダイキン', 'air_conditioner', 'AN25RRS-W'),
  ('ダイキン', 'air_conditioner', 'AN25SABKS-W'),
  ('ダイキン', 'air_conditioner', 'AN25SAS-W'),
  ('ダイキン', 'air_conditioner', 'AN25SASK-W'),
  ('ダイキン', 'air_conditioner', 'AN25SRS-C'),
  ('ダイキン', 'air_conditioner', 'AN25SRS-W'),
  ('ダイキン', 'air_conditioner', 'AN28RAS-W')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('ダイキン', 'air_conditioner', 'AN28RASK-W'),
  ('ダイキン', 'air_conditioner', 'AN28RRS-C'),
  ('ダイキン', 'air_conditioner', 'AN28RRS-W'),
  ('ダイキン', 'air_conditioner', 'AN28SABKS-W'),
  ('ダイキン', 'air_conditioner', 'AN28SAS-W'),
  ('ダイキン', 'air_conditioner', 'AN28SASK-W'),
  ('ダイキン', 'air_conditioner', 'AN28SRS-C'),
  ('ダイキン', 'air_conditioner', 'AN28SRS-W'),
  ('ダイキン', 'air_conditioner', 'AN36RAS-W'),
  ('ダイキン', 'air_conditioner', 'AN36RASK-W'),
  ('ダイキン', 'air_conditioner', 'AN36RRS-C'),
  ('ダイキン', 'air_conditioner', 'AN36RRS-W'),
  ('ダイキン', 'air_conditioner', 'AN36SABKS-W'),
  ('ダイキン', 'air_conditioner', 'AN36SAS-W'),
  ('ダイキン', 'air_conditioner', 'AN36SASK-W'),
  ('ダイキン', 'air_conditioner', 'AN36SRS-C'),
  ('ダイキン', 'air_conditioner', 'AN36SRS-W'),
  ('ダイキン', 'air_conditioner', 'AN40RAP-W'),
  ('ダイキン', 'air_conditioner', 'AN40RAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40RRP-C'),
  ('ダイキン', 'air_conditioner', 'AN40RRP-W'),
  ('ダイキン', 'air_conditioner', 'AN40RRS-W'),
  ('ダイキン', 'air_conditioner', 'AN40SABKP-W'),
  ('ダイキン', 'air_conditioner', 'AN40SAP-W'),
  ('ダイキン', 'air_conditioner', 'AN40SAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN40SRP-C'),
  ('ダイキン', 'air_conditioner', 'AN40SRP-W'),
  ('ダイキン', 'air_conditioner', 'AN40SRS-W'),
  ('ダイキン', 'air_conditioner', 'AN56RAP-W'),
  ('ダイキン', 'air_conditioner', 'AN56RAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56RRP-C'),
  ('ダイキン', 'air_conditioner', 'AN56RRP-W'),
  ('ダイキン', 'air_conditioner', 'AN56SABKP-W'),
  ('ダイキン', 'air_conditioner', 'AN56SAP-W'),
  ('ダイキン', 'air_conditioner', 'AN56SAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN56SRP-C'),
  ('ダイキン', 'air_conditioner', 'AN56SRP-W'),
  ('ダイキン', 'air_conditioner', 'AN63RAP-W'),
  ('ダイキン', 'air_conditioner', 'AN63RAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN63RRP-C'),
  ('ダイキン', 'air_conditioner', 'AN63RRP-W'),
  ('ダイキン', 'air_conditioner', 'AN63SABKP-W'),
  ('ダイキン', 'air_conditioner', 'AN63SAP-W'),
  ('ダイキン', 'air_conditioner', 'AN63SAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN63SRP-C'),
  ('ダイキン', 'air_conditioner', 'AN63SRP-W'),
  ('ダイキン', 'air_conditioner', 'AN71RAP-W'),
  ('ダイキン', 'air_conditioner', 'AN71RAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN71RRP-C'),
  ('ダイキン', 'air_conditioner', 'AN71RRP-W'),
  ('ダイキン', 'air_conditioner', 'AN71SABKP-W'),
  ('ダイキン', 'air_conditioner', 'AN71SAP-W'),
  ('ダイキン', 'air_conditioner', 'AN71SAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN71SRP-C'),
  ('ダイキン', 'air_conditioner', 'AN71SRP-W'),
  ('ダイキン', 'air_conditioner', 'AN80RAP-W'),
  ('ダイキン', 'air_conditioner', 'AN80RAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN80RRP-W'),
  ('ダイキン', 'air_conditioner', 'AN80SABKP-W'),
  ('ダイキン', 'air_conditioner', 'AN80SAP-W'),
  ('ダイキン', 'air_conditioner', 'AN80SAPK-W'),
  ('ダイキン', 'air_conditioner', 'AN80SRP-W'),
  ('日立', 'air_conditioner', 'RAS-KS22K'),
  ('日立', 'air_conditioner', 'RAS-KS22L'),
  ('日立', 'air_conditioner', 'RAS-KS25K'),
  ('日立', 'air_conditioner', 'RAS-KS25L'),
  ('日立', 'air_conditioner', 'RAS-KS28K'),
  ('日立', 'air_conditioner', 'RAS-KS28L'),
  ('日立', 'air_conditioner', 'RAS-KS36K'),
  ('日立', 'air_conditioner', 'RAS-KS36L'),
  ('日立', 'air_conditioner', 'RAS-S22K'),
  ('日立', 'air_conditioner', 'RAS-S22KBK'),
  ('日立', 'air_conditioner', 'RAS-S22L'),
  ('日立', 'air_conditioner', 'RAS-S22M'),
  ('日立', 'air_conditioner', 'RAS-S25K'),
  ('日立', 'air_conditioner', 'RAS-S25KBK'),
  ('日立', 'air_conditioner', 'RAS-S25L'),
  ('日立', 'air_conditioner', 'RAS-S25M'),
  ('日立', 'air_conditioner', 'RAS-S28K'),
  ('日立', 'air_conditioner', 'RAS-S28KBK'),
  ('日立', 'air_conditioner', 'RAS-S28L'),
  ('日立', 'air_conditioner', 'RAS-S28M'),
  ('日立', 'air_conditioner', 'RAS-S36K'),
  ('日立', 'air_conditioner', 'RAS-S36KBK'),
  ('日立', 'air_conditioner', 'RAS-S36L'),
  ('日立', 'air_conditioner', 'RAS-S36M'),
  ('日立', 'air_conditioner', 'RAS-X22F'),
  ('日立', 'air_conditioner', 'RAS-X22G'),
  ('日立', 'air_conditioner', 'RAS-X22H'),
  ('日立', 'air_conditioner', 'RAS-X22J'),
  ('日立', 'air_conditioner', 'RAS-X22K'),
  ('日立', 'air_conditioner', 'RAS-X22L'),
  ('日立', 'air_conditioner', 'RAS-X22LBK'),
  ('日立', 'air_conditioner', 'RAS-X25F'),
  ('日立', 'air_conditioner', 'RAS-X25G'),
  ('日立', 'air_conditioner', 'RAS-X25H'),
  ('日立', 'air_conditioner', 'RAS-X25J'),
  ('日立', 'air_conditioner', 'RAS-X25K'),
  ('日立', 'air_conditioner', 'RAS-X25L'),
  ('日立', 'air_conditioner', 'RAS-X25LBK'),
  ('日立', 'air_conditioner', 'RAS-X28F'),
  ('日立', 'air_conditioner', 'RAS-X28G'),
  ('日立', 'air_conditioner', 'RAS-X28H'),
  ('日立', 'air_conditioner', 'RAS-X28J'),
  ('日立', 'air_conditioner', 'RAS-X28K'),
  ('日立', 'air_conditioner', 'RAS-X28L'),
  ('日立', 'air_conditioner', 'RAS-X28LBK'),
  ('日立', 'air_conditioner', 'RAS-X36F'),
  ('日立', 'air_conditioner', 'RAS-X36G'),
  ('日立', 'air_conditioner', 'RAS-X36H'),
  ('日立', 'air_conditioner', 'RAS-X36J'),
  ('日立', 'air_conditioner', 'RAS-X36K'),
  ('日立', 'air_conditioner', 'RAS-X36LBK'),
  ('日立', 'air_conditioner', 'RAS-XC22F'),
  ('日立', 'air_conditioner', 'RAS-XC22G'),
  ('日立', 'air_conditioner', 'RAS-XC22H'),
  ('日立', 'air_conditioner', 'RAS-XC22J'),
  ('日立', 'air_conditioner', 'RAS-XC22K'),
  ('日立', 'air_conditioner', 'RAS-XC22L'),
  ('日立', 'air_conditioner', 'RAS-XC25F'),
  ('日立', 'air_conditioner', 'RAS-XC25G'),
  ('日立', 'air_conditioner', 'RAS-XC25H'),
  ('日立', 'air_conditioner', 'RAS-XC25J'),
  ('日立', 'air_conditioner', 'RAS-XC25K'),
  ('日立', 'air_conditioner', 'RAS-XC25L'),
  ('日立', 'air_conditioner', 'RAS-XC28F'),
  ('日立', 'air_conditioner', 'RAS-XC28G'),
  ('日立', 'air_conditioner', 'RAS-XC28H'),
  ('日立', 'air_conditioner', 'RAS-XC28J'),
  ('日立', 'air_conditioner', 'RAS-XC28K'),
  ('日立', 'air_conditioner', 'RAS-XC28L'),
  ('日立', 'air_conditioner', 'RAS-XC36F'),
  ('日立', 'air_conditioner', 'RAS-XC36G'),
  ('日立', 'air_conditioner', 'RAS-XC36H'),
  ('日立', 'air_conditioner', 'RAS-XC36J'),
  ('日立', 'air_conditioner', 'RAS-XC36K'),
  ('日立', 'air_conditioner', 'RAS-XC36L'),
  ('日立', 'air_conditioner', 'RAS-XJ22F'),
  ('日立', 'air_conditioner', 'RAS-XJ22G'),
  ('日立', 'air_conditioner', 'RAS-XJ22H'),
  ('日立', 'air_conditioner', 'RAS-XJ22J'),
  ('日立', 'air_conditioner', 'RAS-XJ22K'),
  ('日立', 'air_conditioner', 'RAS-XJ22L'),
  ('日立', 'air_conditioner', 'RAS-XJ25F'),
  ('日立', 'air_conditioner', 'RAS-XJ25G'),
  ('日立', 'air_conditioner', 'RAS-XJ25H'),
  ('日立', 'air_conditioner', 'RAS-XJ25J'),
  ('日立', 'air_conditioner', 'RAS-XJ25K'),
  ('日立', 'air_conditioner', 'RAS-XJ25L'),
  ('日立', 'air_conditioner', 'RAS-XJ28F'),
  ('日立', 'air_conditioner', 'RAS-XJ28G'),
  ('日立', 'air_conditioner', 'RAS-XJ28H'),
  ('日立', 'air_conditioner', 'RAS-XJ28J'),
  ('日立', 'air_conditioner', 'RAS-XJ28K'),
  ('日立', 'air_conditioner', 'RAS-XJ28L'),
  ('日立', 'air_conditioner', 'RAS-XJ36F'),
  ('日立', 'air_conditioner', 'RAS-XJ36G'),
  ('日立', 'air_conditioner', 'RAS-XJ36H'),
  ('日立', 'air_conditioner', 'RAS-XJ36J'),
  ('日立', 'air_conditioner', 'RAS-XJ36K'),
  ('日立', 'air_conditioner', 'RAS-XJ36L'),
  ('日立', 'air_conditioner', 'RAS-XK25G'),
  ('日立', 'air_conditioner', 'RAS-XK25H'),
  ('日立', 'air_conditioner', 'RAS-XK25J'),
  ('日立', 'air_conditioner', 'RAS-XK25K'),
  ('日立', 'air_conditioner', 'RAS-XK25L'),
  ('日立', 'air_conditioner', 'RAS-XK25M'),
  ('日立', 'air_conditioner', 'RAS-YZ28F'),
  ('日立', 'air_conditioner', 'RAS-ZJ22H'),
  ('日立', 'air_conditioner', 'RAS-ZJ22J'),
  ('日立', 'air_conditioner', 'RAS-ZJ22K'),
  ('日立', 'air_conditioner', 'RAS-ZJ22L'),
  ('日立', 'air_conditioner', 'RAS-ZJ22M'),
  ('日立', 'air_conditioner', 'RAS-ZJ22ME'),
  ('日立', 'air_conditioner', 'RAS-ZJ25H'),
  ('日立', 'air_conditioner', 'RAS-ZJ25J'),
  ('日立', 'air_conditioner', 'RAS-ZJ25K'),
  ('日立', 'air_conditioner', 'RAS-ZJ25L'),
  ('日立', 'air_conditioner', 'RAS-ZJ25M'),
  ('日立', 'air_conditioner', 'RAS-ZJ25ME'),
  ('日立', 'air_conditioner', 'RAS-ZJ28H'),
  ('日立', 'air_conditioner', 'RAS-ZJ28J'),
  ('日立', 'air_conditioner', 'RAS-ZJ28K'),
  ('日立', 'air_conditioner', 'RAS-ZJ28L'),
  ('日立', 'air_conditioner', 'RAS-ZJ28M'),
  ('日立', 'air_conditioner', 'RAS-ZJ28ME'),
  ('日立', 'air_conditioner', 'RAS-ZJ36H'),
  ('日立', 'air_conditioner', 'RAS-ZJ36J'),
  ('日立', 'air_conditioner', 'RAS-ZJ36K'),
  ('日立', 'air_conditioner', 'RAS-ZJ36L'),
  ('日立', 'air_conditioner', 'RAS-ZJ36M'),
  ('日立', 'air_conditioner', 'RAS-ZJ36ME'),
  ('日立', 'air_conditioner', 'RAS-G22S'),
  ('日立', 'air_conditioner', 'RAS-G22T'),
  ('日立', 'air_conditioner', 'RAS-G25S'),
  ('日立', 'air_conditioner', 'RAS-G25T'),
  ('日立', 'air_conditioner', 'RAS-G28S'),
  ('日立', 'air_conditioner', 'RAS-G28T'),
  ('日立', 'air_conditioner', 'RAS-GT22T'),
  ('日立', 'air_conditioner', 'RAS-GT25T')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('日立', 'air_conditioner', 'RAS-GT28T'),
  ('日立', 'air_conditioner', 'RAS-GX22S'),
  ('日立', 'air_conditioner', 'RAS-GX25S'),
  ('日立', 'air_conditioner', 'RAS-GX28S'),
  ('日立', 'air_conditioner', 'RAS-GY22S'),
  ('日立', 'air_conditioner', 'RAS-GY22T'),
  ('日立', 'air_conditioner', 'RAS-GY25S'),
  ('日立', 'air_conditioner', 'RAS-GY25T'),
  ('日立', 'air_conditioner', 'RAS-GY28S'),
  ('日立', 'air_conditioner', 'RAS-GY28T'),
  ('日立', 'air_conditioner', 'RAS-GZ22S'),
  ('日立', 'air_conditioner', 'RAS-GZ22T'),
  ('日立', 'air_conditioner', 'RAS-GZ25S'),
  ('日立', 'air_conditioner', 'RAS-GZ25T'),
  ('日立', 'air_conditioner', 'RAS-GZ28S'),
  ('日立', 'air_conditioner', 'RAS-GZ28T'),
  ('日立', 'air_conditioner', 'RAS-GZ36T'),
  ('日立', 'air_conditioner', 'RAS-HJ22T'),
  ('日立', 'air_conditioner', 'RAS-HJ22V'),
  ('日立', 'air_conditioner', 'RAS-HJ25T'),
  ('日立', 'air_conditioner', 'RAS-HJ25V'),
  ('日立', 'air_conditioner', 'RAS-HJ28T'),
  ('日立', 'air_conditioner', 'RAS-HJ28V'),
  ('日立', 'air_conditioner', 'RAS-HJ36T'),
  ('日立', 'air_conditioner', 'RAS-HJ36V'),
  ('日立', 'air_conditioner', 'RAS-KJ22X'),
  ('日立', 'air_conditioner', 'RAS-KJ22Y'),
  ('日立', 'air_conditioner', 'RAS-KJ25X'),
  ('日立', 'air_conditioner', 'RAS-KJ25Y'),
  ('日立', 'air_conditioner', 'RAS-KJ28X'),
  ('日立', 'air_conditioner', 'RAS-KJ28Y'),
  ('日立', 'air_conditioner', 'RAS-KJ36X'),
  ('日立', 'air_conditioner', 'RAS-KJ36Y'),
  ('日立', 'air_conditioner', 'RAS-N22S'),
  ('日立', 'air_conditioner', 'RAS-N22T'),
  ('日立', 'air_conditioner', 'RAS-N25S'),
  ('日立', 'air_conditioner', 'RAS-N25T'),
  ('日立', 'air_conditioner', 'RAS-N28S'),
  ('日立', 'air_conditioner', 'RAS-N28T'),
  ('日立', 'air_conditioner', 'RAS-NF225'),
  ('日立', 'air_conditioner', 'RAS-NJ22T'),
  ('日立', 'air_conditioner', 'RAS-NJ25T'),
  ('日立', 'air_conditioner', 'RAS-NJ28T'),
  ('日立', 'air_conditioner', 'RAS-NJ28V'),
  ('日立', 'air_conditioner', 'RAS-NJ36T'),
  ('日立', 'air_conditioner', 'RAS-NJ36V'),
  ('日立', 'air_conditioner', 'RAS-WR4025D'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV2517'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV2817S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV4017S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV5617S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV6317S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV250'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV280S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV400S'),
  ('三菱電機', 'air_conditioner', 'MSZ-HXV560S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV220'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV221'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV224'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV250'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV251'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV254'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV280'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV280S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV281'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV281S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV284'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV284S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV360'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV360S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV361'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV361S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV364'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV364S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV400S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV401S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV404S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV560S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV561S'),
  ('三菱電機', 'air_conditioner', 'MSZ-JXV564S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW220'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW229'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW250'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW259'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW289'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW360'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW369'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW400S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW409S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW509S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW560S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW630S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW710S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV220'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV229'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV250'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV259'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV280'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV280S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV289'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV289S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV360'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV360S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV369'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV369S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2221'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2521'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2821S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD3621S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD4021S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD5621S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD6321S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV2220'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV2520'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV2820S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV3620S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV4020S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV5620S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2220'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2520'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2820S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD3620S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD4020S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD5620S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD6320S'),
  ('三菱電機', 'air_conditioner', 'MSZ-GV5625S'),
  ('三菱電機', 'air_conditioner', 'MSZ-AH2217'),
  ('三菱電機', 'air_conditioner', 'MSZ-AH225'),
  ('三菱電機', 'air_conditioner', 'MSZ-AH255'),
  ('三菱電機', 'air_conditioner', 'MSZ-AH565S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV285S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV3618S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV365S'),
  ('三菱電機', 'air_conditioner', 'MSZ-L2216'),
  ('三菱電機', 'air_conditioner', 'MSZ-L2217'),
  ('三菱電機', 'air_conditioner', 'MSZ-L225'),
  ('三菱電機', 'air_conditioner', 'MSZ-L2516'),
  ('三菱電機', 'air_conditioner', 'MSZ-L2517'),
  ('三菱電機', 'air_conditioner', 'MSZ-L255'),
  ('三菱電機', 'air_conditioner', 'MSZ-L2816'),
  ('三菱電機', 'air_conditioner', 'MSZ-L2817'),
  ('三菱電機', 'air_conditioner', 'MSZ-L285'),
  ('三菱電機', 'air_conditioner', 'MSZ-L3616'),
  ('三菱電機', 'air_conditioner', 'MSZ-L3617'),
  ('三菱電機', 'air_conditioner', 'MSZ-L365'),
  ('三菱電機', 'air_conditioner', 'MSZ-L4016S'),
  ('三菱電機', 'air_conditioner', 'MSZ-L4017S'),
  ('三菱電機', 'air_conditioner', 'MSZ-L405S'),
  ('三菱電機', 'air_conditioner', 'MSZ-L5616S'),
  ('三菱電機', 'air_conditioner', 'MSZ-L5617S'),
  ('三菱電機', 'air_conditioner', 'MSZ-L565S'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK2216'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK2217'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK2218'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK2516'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK2517'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK2518'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK2816'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK2817'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK2818'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK3616'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK3617'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK3618'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK4016S'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK4017S'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK4018S'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK5616S'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK5617S'),
  ('三菱電機', 'air_conditioner', 'MSZ-LK5618S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV2217'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV2517'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV2817S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV3617S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV4017S'),
  ('三菱電機', 'air_conditioner', 'MSZ-NXV5617S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2217'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2218'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2517'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2518'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2817S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2818S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD2819'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD3617S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD3618S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD4017S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD4018S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD5617S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD5618S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD6317S'),
  ('三菱電機', 'air_conditioner', 'MSZ-XD6318S'),
  ('三菱電機', 'air_conditioner', 'MSZ-YL2517'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW253'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW364'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW403S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW563S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW564S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW713S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZW804S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV223'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV363')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV403S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV563S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV564S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV804S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV220'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV228'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV229'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV250'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV258'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV259'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV280'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV288'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV289'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV360'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV368'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV369'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV400S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV408S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV409S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV508S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV509S'),
  ('三菱電機', 'air_conditioner', 'MSZ-BXV560S'),
  ('三菱電機', 'air_conditioner', 'MSZ-GR220'),
  ('三菱電機', 'air_conditioner', 'MSZ-GR250'),
  ('三菱電機', 'air_conditioner', 'MSZ-GR400S'),
  ('三菱電機', 'air_conditioner', 'MSZ-GR560S'),
  ('三菱電機', 'air_conditioner', 'MSZ-GS229'),
  ('三菱電機', 'air_conditioner', 'MSZ-GS259'),
  ('三菱電機', 'air_conditioner', 'MSZ-GS289'),
  ('三菱電機', 'air_conditioner', 'MSZ-GS369'),
  ('三菱電機', 'air_conditioner', 'MSZ-GS409S'),
  ('三菱電機', 'air_conditioner', 'MSZ-GS509S'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW228'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW258'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW259'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW288'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW289'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW368'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW369'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW408S'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW409S'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW508S'),
  ('三菱電機', 'air_conditioner', 'MSZ-GW509S'),
  ('三菱電機', 'air_conditioner', 'MSZ-SS228'),
  ('三菱電機', 'air_conditioner', 'MSZ-SS258'),
  ('三菱電機', 'air_conditioner', 'MSZ-SS288'),
  ('三菱電機', 'air_conditioner', 'MSZ-SS368'),
  ('三菱電機', 'air_conditioner', 'MSZ-SS408S'),
  ('三菱電機', 'air_conditioner', 'MSZ-SS508S'),
  ('三菱電機', 'air_conditioner', 'MSZ-SW407S'),
  ('三菱電機', 'air_conditioner', 'MSZ-ZXV408S'),
  ('Panasonic', 'microwave', 'NE-UBS10C'),
  ('Panasonic', 'microwave', 'NE-BS1600'),
  ('Panasonic', 'microwave', 'NE-BS651'),
  ('Panasonic', 'microwave', 'NE-BS802'),
  ('Panasonic', 'microwave', 'NE-BS806'),
  ('Panasonic', 'microwave', 'NE-BS902'),
  ('Panasonic', 'microwave', 'NE-BS903'),
  ('Panasonic', 'microwave', 'NE-BS908'),
  ('Panasonic', 'microwave', 'NE-BS1200'),
  ('Panasonic', 'microwave', 'NE-BS803'),
  ('Panasonic', 'microwave', 'NE-BS804'),
  ('Panasonic', 'microwave', 'NE-BS805'),
  ('Panasonic', 'microwave', 'NE-BS904'),
  ('Panasonic', 'microwave', 'NE-BS905'),
  ('Panasonic', 'microwave', 'NE-BS907'),
  ('Panasonic', 'microwave', 'NE-BS1100'),
  ('Panasonic', 'microwave', 'NE-BS1300'),
  ('Panasonic', 'microwave', 'NE-BS1400'),
  ('Panasonic', 'microwave', 'NE-BS2700'),
  ('Panasonic', 'microwave', 'NE-BS801'),
  ('Panasonic', 'microwave', 'NE-BS901'),
  ('Panasonic', 'microwave', 'NE-CBS2700'),
  ('日立', 'microwave', 'MRO-A4'),
  ('日立', 'microwave', 'MRO-EA4'),
  ('日立', 'microwave', 'MRO-SA4'),
  ('日立', 'microwave', 'MRO-X5'),
  ('日立', 'microwave', 'MRO-DV100'),
  ('日立', 'microwave', 'MRO-GV100'),
  ('日立', 'microwave', 'MRO-JV100'),
  ('日立', 'microwave', 'MRO-DS8'),
  ('日立', 'microwave', 'MRO-LS8'),
  ('日立', 'microwave', 'MRO-MS8'),
  ('日立', 'microwave', 'MRO-RS8'),
  ('日立', 'microwave', 'MRO-LS7'),
  ('日立', 'microwave', 'MRO-NF6'),
  ('日立', 'microwave', 'MRO-NV2000'),
  ('日立', 'microwave', 'MRO-RBK5000'),
  ('日立', 'microwave', 'MRO-RF6'),
  ('日立', 'microwave', 'MRO-RS7'),
  ('日立', 'microwave', 'MRO-SE1000'),
  ('日立', 'microwave', 'MRO-SV1000'),
  ('日立', 'microwave', 'MRO-SV2000'),
  ('日立', 'microwave', 'MRO-CS7'),
  ('日立', 'microwave', 'MRO-MBK3000T'),
  ('東芝', 'microwave', 'ER-JD10'),
  ('東芝', 'microwave', 'ER-JD10A'),
  ('東芝', 'microwave', 'ER-KD10'),
  ('東芝', 'microwave', 'ER-KK20'),
  ('東芝', 'microwave', 'ER-LD10'),
  ('東芝', 'microwave', 'ER-MD100'),
  ('東芝', 'microwave', 'ER-ND100'),
  ('東芝', 'microwave', 'ER-PD100'),
  ('東芝', 'microwave', 'ER-RD100'),
  ('東芝', 'microwave', 'ER-KSD100'),
  ('東芝', 'microwave', 'ER-JZ1000'),
  ('東芝', 'microwave', 'ER-JZ2000'),
  ('東芝', 'microwave', 'ER-JZ3000'),
  ('東芝', 'microwave', 'ER-JZ4000'),
  ('東芝', 'microwave', 'ER-JZ5000'),
  ('東芝', 'microwave', 'ER-MD300'),
  ('東芝', 'microwave', 'ER-MD400'),
  ('東芝', 'microwave', 'ER-MD500'),
  ('東芝', 'microwave', 'ER-ND400'),
  ('東芝', 'microwave', 'ER-ND500'),
  ('東芝', 'microwave', 'ER-PD3000'),
  ('東芝', 'microwave', 'ER-PD5000'),
  ('東芝', 'microwave', 'ER-PD7000'),
  ('東芝', 'microwave', 'ER-RD5000'),
  ('東芝', 'microwave', 'ER-RD7000'),
  ('東芝', 'microwave', 'ER-SD5000'),
  ('東芝', 'microwave', 'ER-SD7000'),
  ('東芝', 'microwave', 'ER-TD3000'),
  ('東芝', 'microwave', 'ER-TD5000'),
  ('東芝', 'microwave', 'ER-TD7000'),
  ('東芝', 'microwave', 'ER-VD5000'),
  ('東芝', 'microwave', 'ER-VD7000'),
  ('東芝', 'microwave', 'ER-WD5000'),
  ('東芝', 'microwave', 'ER-WD7000'),
  ('シャープ', 'microwave', 'AX-CX1'),
  ('シャープ', 'microwave', 'AX-GX1'),
  ('シャープ', 'microwave', 'AX-GX3'),
  ('シャープ', 'microwave', 'AX-HC3'),
  ('シャープ', 'microwave', 'AX-HC4'),
  ('シャープ', 'microwave', 'AX-HT2'),
  ('シャープ', 'microwave', 'AX-HT3'),
  ('シャープ', 'microwave', 'AX-MX2'),
  ('シャープ', 'microwave', 'AX-MX3'),
  ('シャープ', 'microwave', 'AX-PX3'),
  ('シャープ', 'microwave', 'AX-LSX3B'),
  ('シャープ', 'microwave', 'AX-XA10'),
  ('Panasonic', 'refrigerator', 'NR-FTF556'),
  ('Panasonic', 'refrigerator', 'NR-ETR438'),
  ('Panasonic', 'refrigerator', 'NR-F607XV'),
  ('Panasonic', 'refrigerator', 'NR-E438TG'),
  ('Panasonic', 'refrigerator', 'NR-F503TE'),
  ('Panasonic', 'refrigerator', 'NR-E438TGL'),
  ('Panasonic', 'refrigerator', 'NR-E414GV'),
  ('Panasonic', 'refrigerator', 'NR-E414V'),
  ('Panasonic', 'refrigerator', 'NR-E414VL'),
  ('Panasonic', 'refrigerator', 'NR-E431V'),
  ('Panasonic', 'refrigerator', 'NR-E507EX'),
  ('Panasonic', 'refrigerator', 'NR-E507EXL'),
  ('Panasonic', 'refrigerator', 'NR-F454HPX'),
  ('Panasonic', 'refrigerator', 'NR-F506HPX'),
  ('Panasonic', 'refrigerator', 'NR-F654HPX'),
  ('Panasonic', 'refrigerator', 'NR-SHF555X'),
  ('Panasonic', 'refrigerator', 'NR-F472V'),
  ('Panasonic', 'refrigerator', 'NR-F510PV'),
  ('Panasonic', 'refrigerator', 'NR-E431GV'),
  ('Panasonic', 'refrigerator', 'NR-F603WPV'),
  ('Panasonic', 'refrigerator', 'NR-E412PV'),
  ('Panasonic', 'refrigerator', 'NR-E412PVL'),
  ('Panasonic', 'refrigerator', 'NR-F552PV'),
  ('Panasonic', 'refrigerator', 'NR-F502PV'),
  ('Panasonic', 'refrigerator', 'NR-E401T'),
  ('Panasonic', 'refrigerator', 'NR-B148W'),
  ('Panasonic', 'refrigerator', 'NR-B178W'),
  ('Panasonic', 'refrigerator', 'NR-F468T'),
  ('Panasonic', 'refrigerator', 'NR-C32DM'),
  ('Panasonic', 'refrigerator', 'NR-C32EM'),
  ('Panasonic', 'refrigerator', 'NR-C32EML'),
  ('Panasonic', 'refrigerator', 'NR-C371N'),
  ('Panasonic', 'refrigerator', 'NR-C371NL'),
  ('Panasonic', 'refrigerator', 'NR-C37EM'),
  ('Panasonic', 'refrigerator', 'NR-C37EML'),
  ('Panasonic', 'refrigerator', 'NR-FTF456'),
  ('Panasonic', 'refrigerator', 'NR-C371GN'),
  ('Panasonic', 'refrigerator', 'NR-F455T'),
  ('日立', 'refrigerator', 'R-F440D'),
  ('日立', 'refrigerator', 'R-F440E'),
  ('日立', 'refrigerator', 'R-F480D'),
  ('日立', 'refrigerator', 'R-F480E'),
  ('日立', 'refrigerator', 'R-F480F'),
  ('日立', 'refrigerator', 'R-F520D'),
  ('日立', 'refrigerator', 'R-F520E'),
  ('日立', 'refrigerator', 'R-F520F'),
  ('日立', 'refrigerator', 'R-G4800D'),
  ('日立', 'refrigerator', 'R-G4800E'),
  ('日立', 'refrigerator', 'R-G4800F'),
  ('日立', 'refrigerator', 'R-G5200D'),
  ('日立', 'refrigerator', 'R-G5200E'),
  ('日立', 'refrigerator', 'R-G5200F'),
  ('日立', 'refrigerator', 'R-G5700D'),
  ('日立', 'refrigerator', 'R-G5700E'),
  ('日立', 'refrigerator', 'R-G5700F'),
  ('日立', 'refrigerator', 'R-G6200D'),
  ('日立', 'refrigerator', 'R-G6200E'),
  ('日立', 'refrigerator', 'R-GS4800H'),
  ('日立', 'refrigerator', 'R-GS5100H')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('日立', 'refrigerator', 'R-M5700D'),
  ('日立', 'refrigerator', 'R-M6200D'),
  ('日立', 'refrigerator', 'R-M6700D'),
  ('日立', 'refrigerator', 'R-S4700D'),
  ('日立', 'refrigerator', 'R-S4700E'),
  ('日立', 'refrigerator', 'R-S4700F'),
  ('日立', 'refrigerator', 'R-S5000D'),
  ('日立', 'refrigerator', 'R-S5000E'),
  ('日立', 'refrigerator', 'R-S5000F'),
  ('日立', 'refrigerator', 'R-WX5600G'),
  ('日立', 'refrigerator', 'R-WX6200G'),
  ('日立', 'refrigerator', 'R-WX62J'),
  ('日立', 'refrigerator', 'R-WX62K'),
  ('日立', 'refrigerator', 'R-WX7400G'),
  ('日立', 'refrigerator', 'R-WX74J'),
  ('日立', 'refrigerator', 'R-WX74K'),
  ('日立', 'refrigerator', 'R-WXC62N'),
  ('日立', 'refrigerator', 'R-WXC62S'),
  ('日立', 'refrigerator', 'R-WXC74N'),
  ('日立', 'refrigerator', 'R-X5200E'),
  ('日立', 'refrigerator', 'R-X5200F'),
  ('日立', 'refrigerator', 'R-X5700E'),
  ('日立', 'refrigerator', 'R-X5700F'),
  ('日立', 'refrigerator', 'R-X6200D'),
  ('日立', 'refrigerator', 'R-X6200E'),
  ('日立', 'refrigerator', 'R-X6200F'),
  ('日立', 'refrigerator', 'R-XG4800G'),
  ('日立', 'refrigerator', 'R-XG4800H'),
  ('日立', 'refrigerator', 'R-XG48J'),
  ('日立', 'refrigerator', 'R-XG48K'),
  ('日立', 'refrigerator', 'R-XG5100G'),
  ('日立', 'refrigerator', 'R-XG5100H'),
  ('日立', 'refrigerator', 'R-XG51J'),
  ('日立', 'refrigerator', 'R-XG5600G'),
  ('日立', 'refrigerator', 'R-XG56J'),
  ('日立', 'refrigerator', 'R-XG6200G'),
  ('日立', 'refrigerator', 'R-XG6200H'),
  ('日立', 'refrigerator', 'R-MW5700D'),
  ('日立', 'refrigerator', 'R-Z5700'),
  ('日立', 'refrigerator', 'R-K40H'),
  ('日立', 'refrigerator', 'R-K42D'),
  ('日立', 'refrigerator', 'R-K42E'),
  ('日立', 'refrigerator', 'R-K42F'),
  ('日立', 'refrigerator', 'R-S4000G'),
  ('日立', 'refrigerator', 'R-S4000H'),
  ('日立', 'refrigerator', 'R-S40J'),
  ('日立', 'refrigerator', 'R-S40K'),
  ('日立', 'refrigerator', 'R-S40N'),
  ('日立', 'refrigerator', 'R-S40R'),
  ('日立', 'refrigerator', 'R-S4200E'),
  ('日立', 'refrigerator', 'R-S4200F'),
  ('日立', 'refrigerator', 'R-C6200U'),
  ('三菱電機', 'refrigerator', 'MR-B46E'),
  ('三菱電機', 'refrigerator', 'MR-MB45F'),
  ('三菱電機', 'refrigerator', 'MR-MB45G'),
  ('三菱電機', 'refrigerator', 'MR-MD45K'),
  ('三菱電機', 'refrigerator', 'MR-MD45M'),
  ('三菱電機', 'refrigerator', 'MR-MX57F'),
  ('三菱電機', 'refrigerator', 'MR-MX57G'),
  ('三菱電機', 'refrigerator', 'MR-R46J'),
  ('三菱電機', 'refrigerator', 'MR-WX52F'),
  ('三菱電機', 'refrigerator', 'MR-WXD70J'),
  ('三菱電機', 'refrigerator', 'MR-EX62S'),
  ('三菱電機', 'refrigerator', 'MR-R44A'),
  ('三菱電機', 'refrigerator', 'MR-P15E'),
  ('三菱電機', 'refrigerator', 'MR-MZ60H'),
  ('三菱電機', 'refrigerator', 'MR-B46G'),
  ('三菱電機', 'refrigerator', 'MR-WX47G'),
  ('東芝', 'refrigerator', 'GR-A34N'),
  ('東芝', 'refrigerator', 'GR-A37G'),
  ('東芝', 'refrigerator', 'GR-A37GL'),
  ('東芝', 'refrigerator', 'GR-A38N'),
  ('東芝', 'refrigerator', 'GR-A41G'),
  ('東芝', 'refrigerator', 'GR-A41GL'),
  ('東芝', 'refrigerator', 'GR-A41N'),
  ('東芝', 'refrigerator', 'GR-A41NL'),
  ('東芝', 'refrigerator', 'GR-A43F'),
  ('東芝', 'refrigerator', 'GR-A47F'),
  ('東芝', 'refrigerator', 'GR-A51R'),
  ('東芝', 'refrigerator', 'GR-B33G'),
  ('東芝', 'refrigerator', 'GR-B34N'),
  ('東芝', 'refrigerator', 'GR-B37G'),
  ('東芝', 'refrigerator', 'GR-B37GL'),
  ('東芝', 'refrigerator', 'GR-B38N'),
  ('東芝', 'refrigerator', 'GR-B41G'),
  ('東芝', 'refrigerator', 'GR-B41GL'),
  ('東芝', 'refrigerator', 'GR-B41N'),
  ('東芝', 'refrigerator', 'GR-B41NL'),
  ('東芝', 'refrigerator', 'GR-B43F'),
  ('東芝', 'refrigerator', 'GR-B48F'),
  ('東芝', 'refrigerator', 'GR-B50F'),
  ('東芝', 'refrigerator', 'GR-B55F'),
  ('東芝', 'refrigerator', 'GR-C34N'),
  ('東芝', 'refrigerator', 'GR-C38N'),
  ('東芝', 'refrigerator', 'GR-C42NL'),
  ('東芝', 'refrigerator', 'GR-C43F'),
  ('東芝', 'refrigerator', 'GR-C43G'),
  ('東芝', 'refrigerator', 'GR-C43GL'),
  ('東芝', 'refrigerator', 'GR-C56R'),
  ('東芝', 'refrigerator', 'GR-D43F'),
  ('東芝', 'refrigerator', 'GR-D43N'),
  ('東芝', 'refrigerator', 'GR-D47F'),
  ('東芝', 'refrigerator', 'GR-D50F'),
  ('東芝', 'refrigerator', 'GR-D55F'),
  ('東芝', 'refrigerator', 'GR-E34N'),
  ('東芝', 'refrigerator', 'GR-E38N'),
  ('東芝', 'refrigerator', 'GR-E43G'),
  ('東芝', 'refrigerator', 'GR-E43GL'),
  ('東芝', 'refrigerator', 'GR-E43N'),
  ('東芝', 'refrigerator', 'GR-E47F'),
  ('東芝', 'refrigerator', 'GR-E50F'),
  ('東芝', 'refrigerator', 'GR-E50FX'),
  ('東芝', 'refrigerator', 'GR-E55F'),
  ('東芝', 'refrigerator', 'GR-E55FX'),
  ('東芝', 'refrigerator', 'GR-E62FX'),
  ('東芝', 'refrigerator', 'GR-F43FS'),
  ('東芝', 'refrigerator', 'GR-F43G'),
  ('東芝', 'refrigerator', 'GR-F43GL'),
  ('東芝', 'refrigerator', 'GR-F43N'),
  ('東芝', 'refrigerator', 'GR-F48FX'),
  ('東芝', 'refrigerator', 'GR-F51FXV'),
  ('東芝', 'refrigerator', 'GR-F56FXV'),
  ('東芝', 'refrigerator', 'GR-F62FX'),
  ('東芝', 'refrigerator', 'GR-G34S'),
  ('東芝', 'refrigerator', 'GR-G34SY'),
  ('東芝', 'refrigerator', 'GR-G38S'),
  ('東芝', 'refrigerator', 'GR-G38SXV'),
  ('東芝', 'refrigerator', 'GR-G38SY'),
  ('東芝', 'refrigerator', 'GR-G43G'),
  ('東芝', 'refrigerator', 'GR-G43GL'),
  ('東芝', 'refrigerator', 'GR-G48FS'),
  ('東芝', 'refrigerator', 'GR-G48FX'),
  ('東芝', 'refrigerator', 'GR-G51FX'),
  ('東芝', 'refrigerator', 'GR-H34S'),
  ('東芝', 'refrigerator', 'GR-H34SY'),
  ('東芝', 'refrigerator', 'GR-H38S'),
  ('東芝', 'refrigerator', 'GR-H38SXV'),
  ('東芝', 'refrigerator', 'GR-H38SXVL'),
  ('東芝', 'refrigerator', 'GR-H38SY'),
  ('東芝', 'refrigerator', 'GR-H43G'),
  ('東芝', 'refrigerator', 'GR-H43GL'),
  ('東芝', 'refrigerator', 'GR-H43GXV'),
  ('東芝', 'refrigerator', 'GR-H43GXVE'),
  ('東芝', 'refrigerator', 'GR-H43GXVEL'),
  ('東芝', 'refrigerator', 'GR-H43GXVL'),
  ('東芝', 'refrigerator', 'GR-H460FV'),
  ('東芝', 'refrigerator', 'GR-H510FV'),
  ('東芝', 'refrigerator', 'GR-H560FV'),
  ('東芝', 'refrigerator', 'GR-H610FV'),
  ('東芝', 'refrigerator', 'GR-J43G'),
  ('東芝', 'refrigerator', 'GR-J43GL'),
  ('東芝', 'refrigerator', 'GR-J43GXV'),
  ('東芝', 'refrigerator', 'GR-J43GXVE'),
  ('東芝', 'refrigerator', 'GR-J43GXVEL'),
  ('東芝', 'refrigerator', 'GR-J43GXVL'),
  ('東芝', 'refrigerator', 'GR-K33S'),
  ('東芝', 'refrigerator', 'GR-K33SXV'),
  ('東芝', 'refrigerator', 'GR-K33SXVL'),
  ('東芝', 'refrigerator', 'GR-K36S'),
  ('東芝', 'refrigerator', 'GR-K36SXV'),
  ('東芝', 'refrigerator', 'GR-K36SXVL'),
  ('東芝', 'refrigerator', 'GR-K47FR'),
  ('東芝', 'refrigerator', 'GR-M33S'),
  ('東芝', 'refrigerator', 'GR-M33SXV'),
  ('東芝', 'refrigerator', 'GR-M33SXVL'),
  ('東芝', 'refrigerator', 'GR-M36S'),
  ('東芝', 'refrigerator', 'GR-M41G'),
  ('東芝', 'refrigerator', 'GR-M41GK'),
  ('東芝', 'refrigerator', 'GR-M41GKL'),
  ('東芝', 'refrigerator', 'GR-M41GL'),
  ('東芝', 'refrigerator', 'GR-M41GXV'),
  ('東芝', 'refrigerator', 'GR-M41GXVL'),
  ('東芝', 'refrigerator', 'GR-M460FDE'),
  ('東芝', 'refrigerator', 'GR-M470GW'),
  ('東芝', 'refrigerator', 'GR-M470GWL'),
  ('東芝', 'refrigerator', 'GR-M47FP'),
  ('東芝', 'refrigerator', 'GR-M47FX'),
  ('東芝', 'refrigerator', 'GR-P41G'),
  ('東芝', 'refrigerator', 'GR-P41GL'),
  ('東芝', 'refrigerator', 'GR-P41GXV'),
  ('東芝', 'refrigerator', 'GR-P41GXVL'),
  ('東芝', 'refrigerator', 'GR-P460FD'),
  ('東芝', 'refrigerator', 'GR-P460FW'),
  ('東芝', 'refrigerator', 'GR-P510FW'),
  ('東芝', 'refrigerator', 'GR-P550FW'),
  ('東芝', 'refrigerator', 'GR-P600FW'),
  ('東芝', 'refrigerator', 'GR-P600FWA'),
  ('東芝', 'refrigerator', 'GR-R33S'),
  ('東芝', 'refrigerator', 'GR-R36S'),
  ('東芝', 'refrigerator', 'GR-R36SXV'),
  ('東芝', 'refrigerator', 'GR-R36SXVL'),
  ('東芝', 'refrigerator', 'GR-R470GW'),
  ('東芝', 'refrigerator', 'GR-R470GWL'),
  ('東芝', 'refrigerator', 'GR-R510FH'),
  ('東芝', 'refrigerator', 'GR-R550FZ'),
  ('東芝', 'refrigerator', 'GR-R600FZ'),
  ('東芝', 'refrigerator', 'GR-T36GT'),
  ('東芝', 'refrigerator', 'GR-T36GTL'),
  ('東芝', 'refrigerator', 'GR-W42FT'),
  ('東芝', 'refrigerator', 'GR-W45FT')
on conflict (manufacturer, model_number) do nothing;

insert into appliances (manufacturer, category, model_number) values
  ('東芝', 'refrigerator', 'GR-W50FT'),
  ('東芝', 'refrigerator', 'GR-X53FT'),
  ('東芝', 'refrigerator', 'GR-X56FT')
on conflict (manufacturer, model_number) do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('バッテリー V8 Absolute', 'battery', 'oem', 'ダイソン'),
  ('糸くずフィルター NA-FA10K2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター ES-GE60R', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE6A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE6C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV7D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70T', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KSV9A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F60PB9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F70PB10', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F70PB11', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F70PB9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA7H2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-CSD7TV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D702S', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-GE55P', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-FA90H2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA90H3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW120V1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-D10TV', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-GE7E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE7F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE7G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV10E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV7C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV80P', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV90P', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KSV9F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KSV9G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PT10F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PT10G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW10E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW11E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW11F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW11G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW8E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW8G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PX8E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PX8F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T714', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T715', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F50B9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60B9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F70PB12', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F8AE7', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AE7', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA70H7', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW120V2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F7PB2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F8AE9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F8AKE1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AE9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AKE1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA110K5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA11K1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA120V5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA12V1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA8H2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA8K1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター ES-GV10F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV10G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV9E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV9G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GW11E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GW11F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GW11G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-A70E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-A80E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-AG70D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-AG80D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-B75D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-SE71E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F50B10', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50B11', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50B13', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50BE5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50BE7', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60B10', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60B11', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60B13', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F70BE6', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60PB14', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60PB15', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9900L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9900R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター ES-GE6E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KSV9E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T712', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T713', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F50B12', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50BE6', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50ME3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50ME4', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60B12', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-TF595', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F10WE8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9WE8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FD80H8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW108KS', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW120V3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW80K8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW90K8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F8AE8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AE8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA70H8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA7H1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F10AKE1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F10WE9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F5B2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F7B2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA9K1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW10K1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW120V5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW12V1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW80K9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW90K9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA70H9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9800L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-D11XWV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D9WV', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-GV7E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV7F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV7G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70V', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70W', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-D75D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KG73V', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KG83V', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-LC70B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-LC80B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG70F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG70G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG80F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG81G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG830', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG84V', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-U70C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-U80C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F50B14', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50BE8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60B14', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F70PB14', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-JFA807', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50B15', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F60B15', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-JFA808', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SJFA808', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX900AR', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7700L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9800R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-V70G', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-GE6F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE6G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX5E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX5F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX6G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F10AKE3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F6PB1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F7PB1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F8AKE3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA11K2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7500L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター ES-GE7H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PT10H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW11H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW8H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-SW11H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG820', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-SJFA807', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA10K3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8700L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8800L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8800R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-D70WV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8WV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D90TS', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DBK70B', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV703S', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV80A', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV80B', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV90A', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV90B', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-GV10H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV9H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F50BE9', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F5B1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F5BE2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F5BE3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F6B1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F6B2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AKE3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA12V2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA9K2', 'filter', 'oem', 'Panasonic')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('糸くずフィルター NA-FW10K2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-JFA8K2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SJFA8K2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SVX880L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SVX880R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7600L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7700R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8500L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-D7SV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV100A', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV100B', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DX110A', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-KSV9H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-C75D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-FA8H3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-D9SV', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-A116', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-A117', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-A60S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-A70S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-D7S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-DD8E', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-E71P', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG60H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG60J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG64', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG65', 'filter', 'oem', 'シャープ'),
  ('バッテリー V7 Absolute', 'battery', 'oem', 'ダイソン'),
  ('糸くずフィルター NA-VX7800L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7800R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8700R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8900L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8900R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8500R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-D8SV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8TV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D9TV', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-GE6H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE6J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE7J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-SW10J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-SW11J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T716', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX6H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG70G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG70H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG73', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG74V', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG84V', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE60K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE60L', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE70L', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE80L', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-K700', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-M7K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-SE81', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-SE91', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T701', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T703', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T704', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG60F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG60G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG60H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG60J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG60K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG60L', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX71', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX72', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX800', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX810', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX820', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-U70D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-U80D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター NA-F8AKE4', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F9AKE4', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA10H3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA11K3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F10AKE4', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA8K3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA9K3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA12V3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA7H3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG1200L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX800AL', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8600L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9700L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9700R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX850SL', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-DBK70C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV100E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV80C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV80E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV90C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV90E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV9F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-E470HV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-E480HV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-E570JV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-E580JV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-E670KV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-E680KV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-KSV100B', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-T800', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-T803', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-T804', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V100A', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V100B', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V70A', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V70B', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V80A', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V80B', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V90A', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V90B', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D7', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV100BBW', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-GV10J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV7H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV7J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV7K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV9J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-LT1', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG60F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG75', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE70K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG72', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG73', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX70', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX73', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター AW-70VF', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VG', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VJ', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VF', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VG', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VJ', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VB', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VB', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VC', 'filter', 'oem', '東芝'),
  ('バッテリー V8 Slim', 'battery', 'oem', 'ダイソン'),
  ('糸くずフィルター NA-SVX80AL', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SVX80AR', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SVX870R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SVX890L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SVX890R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX3600L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX800AR', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8600', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX860S', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX900BL', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9500L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9500R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX850SR', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7500R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-D6MV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D7FV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D7MV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8FV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8GV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8HV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV80F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DX120B', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DX120F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-KSX100F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-T807', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V70F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V80F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V90F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-X100F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-X100G', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-X90G', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V80G', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-KSV9J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW11J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-PW8J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-SH7J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T717', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX6J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-G70', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-SE71', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T702', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-X11A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T805', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター AW-70DE', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DF', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DG', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DJ', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DK', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DE', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DF', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DG', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DJ', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DK', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80SVL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10VP2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VC', 'filter', 'oem', '東芝'),
  ('糸くずフィルター NA-VG1300L', 'filter', 'oem', 'Panasonic')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('糸くずフィルター NA-VG1400L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX3700L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9600R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-D6PV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D7PV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8PV', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-GV10K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-JV9A', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-BG550', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-BG551', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-BG554', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-C55S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-C60S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-CL75D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-CY75D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-D55S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-D60S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-F505', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG54', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG55', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG55F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG55H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-FG55J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE55K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T705', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-X11B', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター AW-70VJE7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VK', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VKE8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VLE9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VJE7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VK', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VKE8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SD5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SD6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SD7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SV5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SV6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SV7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SV8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SV9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10VH1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60GE', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-6DH2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DB', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DC', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7DH2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DC', 'filter', 'oem', '東芝'),
  ('製氷皿 NR-F511XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 R-C4800', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-C5200', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-C5700', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-C6200', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-K40G', 'ice_tray', 'oem', '日立'),
  ('製氷皿 MR-R47T', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX70E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 GR-K510FWX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-K510FD', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-K460FW', 'ice_tray', 'oem', '東芝'),
  ('糸くずフィルター NA-FA70H1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SVX870L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7600', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7600R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX8600R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX900BR', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9600L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-D6LV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D7LV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8JV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8KV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8LV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D8MV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D9GV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-D9HV', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV100C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV120C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV120E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV8E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DX120C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DX120E', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-HG90', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KG73', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-U111', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-W111', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-WD74', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-WD741', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE55L', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV80M', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV90M', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-N75D', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-N7K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T55C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T730V', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG55F', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG55G', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG55H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG55J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG55K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TG55L', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX900', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX910', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX920', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-Y63S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-YD55S', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター AW-10M7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60DL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60DM', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60GK', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60GL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60GM', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60SDF', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-6G2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DJE7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DKE8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DLE9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70GL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70GM', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7G2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DJE7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DKE8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DLE9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VLE9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-90SVL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SD8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-12VP2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-12VP3', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60GC', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60GF', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70GC', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VE', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DB', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VA', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VE', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8D9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8V5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8V6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8V7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8V8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8V9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8VE6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-95JD', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9V5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9V6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9V7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9VE6', 'filter', 'oem', '東芝'),
  ('バッテリー V6 Absolute', 'battery', 'oem', 'ダイソン'),
  ('フィルター AN28VESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28VES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28WEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28WESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28WES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28XEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28XESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28YEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28YESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28YES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28ZEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28ZESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28ZES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN363AES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36REBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36RESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36RES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36SEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36SESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36SES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36TEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36TESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36TES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36UEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36UESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36UES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36VEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36VESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36VES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36WEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36WESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36WES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36XEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36XES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36YEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36YESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36YES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36ZEBKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36ZESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36ZES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN403AEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40REBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40REPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40REP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40RNP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40SEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40SEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40SEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40TEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40TEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40TEP-W', 'filter', 'oem', 'ダイキン')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('フィルター AN40UEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40UEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40UEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40VEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40VEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40VEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40WEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40WEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40WEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40XEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40XEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40XEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40YEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40YEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40ZEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40ZEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40ZEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN563AEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56REBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56REPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56REP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56SEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56SEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56SEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56TEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56TEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56TEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56UEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56UEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56UEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56VEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56VEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56WEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56WEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56WEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56XEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56XEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56XEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56YEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56YEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56YEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56ZEBKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56ZEPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56ZEP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター RAS-A22C', 'filter', 'oem', '日立'),
  ('フィルター RAS-A22E', 'filter', 'oem', '日立'),
  ('フィルター RAS-A25Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-A28C', 'filter', 'oem', '日立'),
  ('フィルター RAS-A28E', 'filter', 'oem', '日立'),
  ('フィルター RAS-A28Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22AE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22BE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22BG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22CE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22CG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22DE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22DG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22FE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22FG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25AE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25BE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25BG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25CE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25CG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25DE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25DG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25E', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25EE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25EG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25F', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25FE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25FG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ25Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28AE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28BE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28BG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28CE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28CG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28DE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28DG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28F', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28FE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28FG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36AE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36BE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36BG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36CE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36CG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36DE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36DG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36F', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36FE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36FG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ40F', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ40G', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJN22A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJN22D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJN25A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJN25D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJN28A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJN28D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJN36A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJN36D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AN22C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AN28C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AS22A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AS22B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AS22C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AS25A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AS25B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AS25C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AS28A', 'filter', 'oem', '日立'),
  ('フィルター RAS-AS28B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AS28C', 'filter', 'oem', '日立'),
  ('フィルター RAS-ASN22B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AT22B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AT25B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AT28B', 'filter', 'oem', '日立'),
  ('フィルター RAS-AW22C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AW22D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AW22E', 'filter', 'oem', '日立'),
  ('フィルター RAS-AW25C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AW25D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AW25E', 'filter', 'oem', '日立'),
  ('フィルター RAS-AW28C', 'filter', 'oem', '日立'),
  ('フィルター RAS-AW28D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AW28E', 'filter', 'oem', '日立'),
  ('フィルター RAS-BJ22D', 'filter', 'oem', '日立'),
  ('フィルター RAS-BJ25D', 'filter', 'oem', '日立'),
  ('フィルター RAS-BJ28D', 'filter', 'oem', '日立'),
  ('フィルター RAS-BJ36D', 'filter', 'oem', '日立'),
  ('フィルター RAS-D22D', 'filter', 'oem', '日立'),
  ('フィルター RAS-D22F', 'filter', 'oem', '日立'),
  ('フィルター RAS-D25D', 'filter', 'oem', '日立'),
  ('フィルター RAS-D25F', 'filter', 'oem', '日立'),
  ('フィルター RAS-D28D', 'filter', 'oem', '日立'),
  ('フィルター RAS-D28F', 'filter', 'oem', '日立'),
  ('フィルター RAS-DT22C', 'filter', 'oem', '日立'),
  ('フィルター RAS-DT25C', 'filter', 'oem', '日立'),
  ('フィルター RAS-DT28C', 'filter', 'oem', '日立'),
  ('フィルター RAS-F220Y', 'filter', 'oem', '日立'),
  ('フィルター RAS-F22C', 'filter', 'oem', '日立'),
  ('フィルター RAS-F22E', 'filter', 'oem', '日立'),
  ('フィルター RAS-F25E', 'filter', 'oem', '日立'),
  ('フィルター RAS-F28C', 'filter', 'oem', '日立'),
  ('フィルター RAS-F28E', 'filter', 'oem', '日立'),
  ('フィルター RAS-F36E', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ22A', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ22B', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ22C', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ22D', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ22F', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ22Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ25A', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ25B', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ25C', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ25D', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ25F', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ25Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ28A', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ28B', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ28C', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ28D', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ28F', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ28Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ36A', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ36B', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ36C', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ36D', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ36F', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ36Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-R22A', 'filter', 'oem', '日立'),
  ('フィルター RAS-R22B', 'filter', 'oem', '日立'),
  ('フィルター RAS-R22C', 'filter', 'oem', '日立'),
  ('フィルター RAS-R22Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-R28A', 'filter', 'oem', '日立'),
  ('フィルター RAS-R28B', 'filter', 'oem', '日立'),
  ('フィルター RAS-R28C', 'filter', 'oem', '日立'),
  ('フィルター RAS-R28Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-RN22Z', 'filter', 'oem', '日立'),
  ('フィルター RAS-RN28Z', 'filter', 'oem', '日立')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('フィルター RAS-VJ2526S', 'filter', 'oem', '日立'),
  ('フィルター RAS-VL7126D', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ2226S', 'filter', 'oem', '日立'),
  ('フィルター MSZ-BXV2216', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV2217', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV225', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV2516', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV2517', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV255', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV2816', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV2817', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV285', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV3616', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV3617', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV365', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV4016S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV4017S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV405S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV5616S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV5617S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV565S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV2518E', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW280', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV2219', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV2519', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV2819S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV3619S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV4019S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2219', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2519', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD3619S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD4019S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD5619S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD6319S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L2218', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L2518', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L2818', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L3618', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L4018S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L5618S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV404S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV634S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X2216', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X225', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X2516', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X255', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X2816', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X285', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X3616', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X365', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X4016S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X405S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X5616S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X565S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X6316S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-X7116S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW223', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW283', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW363', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW633S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW634S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV713S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV259', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV287S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV289S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV407S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV409S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV509S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV228', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV229', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV258', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV259', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV288', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV288S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV289', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV289S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV368', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV368S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV369', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV369S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV408S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV409S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV508S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV509S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SW227', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SW257', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SW287', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SW367', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SW507S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW228', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW257', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW258', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW287', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW367', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW368', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW407S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW408S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW507S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW508S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW637S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW718S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV227', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV228', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV257', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV258', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV287', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV287S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV288', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV288S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV367', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV367S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV368', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV368S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV407S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV507S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV508S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV637S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV638S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV718S', 'filter', 'oem', '三菱電機'),
  ('製氷皿 NR-ETF433', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F504T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E436TL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F478XGM', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F518TV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E416V', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E416VL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E417EX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E417EXL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F502XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F504GV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F505XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F554HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F557HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-FVF504', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-FVF505', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-FVM470S', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F560PV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F553HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E471TL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E471T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E450T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-B146W', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-B145W', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-B144W', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-B175W', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F401A', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F456T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 R-CW5200', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S4200D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 MR-BX52W', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R47W', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R47X', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R52T', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R52W', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-B46A', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-B46C', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX46G', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R46E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R46F', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX47E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX52E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX52H', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX60E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MB45H', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 GR-K50FR', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M50FP', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M50FX', 'ice_tray', 'oem', '東芝'),
  ('糸くずフィルター NA-F60PB8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F70PB8', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA80H1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG1200R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG2200L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG2200R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX3800L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7900L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX7900R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9600', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX3500L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-DBK100F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DX100F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DX90F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-KSV100C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-KSV100E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-T805', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-T806', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V100C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V100CJ', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V100E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V70C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V70E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V80C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V80E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V90C', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V90E', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DV80G', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-X100H', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-X90H', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V80H', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-V70H', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-A70C', 'filter', 'oem', 'シャープ')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('糸くずフィルター ES-A70H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-A80C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-A80H', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-BG552', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-BG553', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-D7C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-DD8C', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-F556', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-A210', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-W112', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-W114', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-ZP1', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70L', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV8', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV80', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV9', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GV90', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-KS70', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TX8', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター AW-50GL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-50GLC', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-6G5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-6G6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-6G8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-6G9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-6GM1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7G5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7G6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7G8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7G9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7GM1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7GME1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-90GF', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-90SDL', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SVE4', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SVE5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SVE6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-502V', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-602GP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-602VP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-603GP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-604GP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60GA', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-60SDC', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-701GP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-702GP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-703GP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-704GP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DA', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70GA', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70GF', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70GK', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VA', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VAV7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70VBE2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-75VCE3', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7D5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7D6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7D7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7D8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7D9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7DE4', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DA', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VAV7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80VBE2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-830JDM', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8D5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8D6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8D7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8D8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8DE4', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8DH1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9DH1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SD5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SV5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SV6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SV7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SV8', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SV9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SVE4', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SVE5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9VH1', 'filter', 'oem', '東芝'),
  ('フィルター CS-HX285C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X225C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X285C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-HX635C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-HX715C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X565C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X405C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F565C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X805C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X635C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X715C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-HX565C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-HX405C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-HX805C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X560D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X220D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X710D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X400D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS630D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X800D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X400D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS280D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X250D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X630D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X360D', 'filter', 'oem', 'Panasonic'),
  ('フィルター AN28XES-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36XESK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター RAS-A22D', 'filter', 'oem', '日立'),
  ('フィルター RAS-A28D', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22E', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22EE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ22EG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28E', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28EE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ28EG', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36E', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36EE', 'filter', 'oem', '日立'),
  ('フィルター RAS-AJ36EG', 'filter', 'oem', '日立'),
  ('フィルター RAS-D22E', 'filter', 'oem', '日立'),
  ('フィルター RAS-D25E', 'filter', 'oem', '日立'),
  ('フィルター RAS-D28E', 'filter', 'oem', '日立'),
  ('フィルター RAS-F22D', 'filter', 'oem', '日立'),
  ('フィルター RAS-F25D', 'filter', 'oem', '日立'),
  ('フィルター RAS-F28D', 'filter', 'oem', '日立'),
  ('フィルター RAS-F36D', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ22E', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ25E', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ28E', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ36E', 'filter', 'oem', '日立'),
  ('フィルター RAS-X36L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XR4026D', 'filter', 'oem', '日立'),
  ('フィルター RAS-XR2826S', 'filter', 'oem', '日立'),
  ('フィルター MSZ-HXV255', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV285S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV405S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV565S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV635S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV400S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZD634S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW404S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV507S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW288', 'filter', 'oem', '三菱電機'),
  ('製氷皿 NR-E401TL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-FTM476S', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-ETR435', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F600XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E433T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F473TM', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F474TM', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F475TM', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F503T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F551XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F553T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F554T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F555T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-J55CC', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F568TV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E414GVL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F516MEX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F555WPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F559HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F604HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F609HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F672XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F602XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F503HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F603HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F473XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F503XPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F511PV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F472PV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F457T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 R-CS4800E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G6700D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-X7300F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG5600H', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-CX6700', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-V5400', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-W5700', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-X6000', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-Y5400', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-Y6000', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-Z6200', 'ice_tray', 'oem', '日立'),
  ('製氷皿 MR-MX46F', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX50G', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX47F', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-P15Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-P17Z', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 GR-M460FWX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M510FWX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M550FWX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M600FWX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M460FW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M510FW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M550FW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M600FW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G43GXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G43GXVL', 'ice_tray', 'oem', '東芝')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('製氷皿 GR-G43GXVE', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G43GXVEL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G56FXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G62FXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M460FD', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M510FD', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R460FH', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-C42N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E43F', 'ice_tray', 'oem', '東芝'),
  ('糸くずフィルター NA-F503K', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F504K', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50B2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-F50B3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FS60H7', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA100H3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA100H5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA100H6', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FA90H1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW100K7', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW80S1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW80S2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW80S3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW80S5', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW80S6', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW90S1', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-FW90S2', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SVX80BL', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-SVX80BR', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG1300R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG1400R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG2300L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG2300R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG2400L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VG2400R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX5E3', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX700AL', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX700AR', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX700BL', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX800BL', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX800BR', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX860SL', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX860SR', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9500', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX3300L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9300L', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター NA-VX9300R', 'filter', 'oem', 'Panasonic'),
  ('糸くずフィルター BW-DKX120F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-X120F', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DKX120G', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-DX120G', 'filter', 'oem', '日立'),
  ('糸くずフィルター BW-X120G', 'filter', 'oem', '日立'),
  ('糸くずフィルター ES-LT850', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-P110', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GE7K', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-Z200', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-Z210', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-R70P', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-T830V', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-TK55J', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター ES-GX8', 'filter', 'oem', 'シャープ'),
  ('糸くずフィルター AW-45M5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-45M7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-45M9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-6DH1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7DH1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-50GK', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-50GKC', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-50GM', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-50GMC', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-5G2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-5GC2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-6D6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7G3', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10DP1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10DP2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10DP3', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SD9', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SDE5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SDE6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-10SDE7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-12DP1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-601GP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-701HVP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70DCE3', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-70GE', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-801HVP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-802MVP', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-80DCE3', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8VM1', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-8VM2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SD6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SD7', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SDE5', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-9SDE6', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-700J2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-700Z2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7GM2', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-7DH3', 'filter', 'oem', '東芝'),
  ('糸くずフィルター AW-700J4', 'filter', 'oem', '東芝'),
  ('フィルター CS-F258C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F288CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F408C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-J258C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-J568C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX221D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX560D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX401D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX801D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-TX639C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-TX288C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-E259CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-TX408C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-EX226C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX568C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX409C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX809C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX229C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX639C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX408C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-AX808C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-E225CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X365C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-EX405C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F285C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-EX225C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-J285C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-E255CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-EX635C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-J405C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-E285CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-GX565C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-GX225C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-EX255C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS225C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F365C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-EX365C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS365C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS565C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-HX365C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F225C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-GX405C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-J225C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-GX255C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS405C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F225CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-EX285C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X365C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS255C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS715C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-GX365C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F405C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F255CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS285C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS365C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS405C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-EX565C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS805C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F255C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-F285CZ', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-J255C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-GX285C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X285C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X405C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS285C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X255C', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS635C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-J365C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-J565C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-EX715C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-WX407C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-WX567C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-WX637C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-WX717C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-WX807C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-WX907C2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X280D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS900D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS220D', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-X900D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS360D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター CS-XS560D2', 'filter', 'oem', 'Panasonic'),
  ('フィルター AN22RAS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN22RASK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN22RRS-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN22RRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN22SABKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN22SAS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN22SASK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN22SRS-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN22SRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN25RAS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN25RASK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN25RRS-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN25RRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN25SABKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN25SAS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN25SASK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN25SRS-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN25SRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28RAS-W', 'filter', 'oem', 'ダイキン')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('フィルター AN28RASK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28RRS-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28RRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28SABKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28SAS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28SASK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28SRS-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN28SRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36RAS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36RASK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36RRS-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36RRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36SABKS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36SAS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36SASK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36SRS-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN36SRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40RAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40RAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40RRP-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40RRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40RRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40SABKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40SAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40SAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40SRP-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40SRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN40SRS-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56RAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56RAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56RRP-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56RRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56SABKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56SAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56SAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56SRP-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN56SRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN63RAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN63RAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN63RRP-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN63RRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN63SABKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN63SAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN63SAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN63SRP-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN63SRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN71RAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN71RAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN71RRP-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN71RRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN71SABKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN71SAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN71SAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN71SRP-C', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN71SRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN80RAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN80RAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN80RRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN80SABKP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN80SAP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN80SAPK-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター AN80SRP-W', 'filter', 'oem', 'ダイキン'),
  ('フィルター RAS-KS22K', 'filter', 'oem', '日立'),
  ('フィルター RAS-KS22L', 'filter', 'oem', '日立'),
  ('フィルター RAS-KS25K', 'filter', 'oem', '日立'),
  ('フィルター RAS-KS25L', 'filter', 'oem', '日立'),
  ('フィルター RAS-KS28K', 'filter', 'oem', '日立'),
  ('フィルター RAS-KS28L', 'filter', 'oem', '日立'),
  ('フィルター RAS-KS36K', 'filter', 'oem', '日立'),
  ('フィルター RAS-KS36L', 'filter', 'oem', '日立'),
  ('フィルター RAS-S22K', 'filter', 'oem', '日立'),
  ('フィルター RAS-S22KBK', 'filter', 'oem', '日立'),
  ('フィルター RAS-S22L', 'filter', 'oem', '日立'),
  ('フィルター RAS-S22M', 'filter', 'oem', '日立'),
  ('フィルター RAS-S25K', 'filter', 'oem', '日立'),
  ('フィルター RAS-S25KBK', 'filter', 'oem', '日立'),
  ('フィルター RAS-S25L', 'filter', 'oem', '日立'),
  ('フィルター RAS-S25M', 'filter', 'oem', '日立'),
  ('フィルター RAS-S28K', 'filter', 'oem', '日立'),
  ('フィルター RAS-S28KBK', 'filter', 'oem', '日立'),
  ('フィルター RAS-S28L', 'filter', 'oem', '日立'),
  ('フィルター RAS-S28M', 'filter', 'oem', '日立'),
  ('フィルター RAS-S36K', 'filter', 'oem', '日立'),
  ('フィルター RAS-S36KBK', 'filter', 'oem', '日立'),
  ('フィルター RAS-S36L', 'filter', 'oem', '日立'),
  ('フィルター RAS-S36M', 'filter', 'oem', '日立'),
  ('フィルター RAS-X22F', 'filter', 'oem', '日立'),
  ('フィルター RAS-X22G', 'filter', 'oem', '日立'),
  ('フィルター RAS-X22H', 'filter', 'oem', '日立'),
  ('フィルター RAS-X22J', 'filter', 'oem', '日立'),
  ('フィルター RAS-X22K', 'filter', 'oem', '日立'),
  ('フィルター RAS-X22L', 'filter', 'oem', '日立'),
  ('フィルター RAS-X22LBK', 'filter', 'oem', '日立'),
  ('フィルター RAS-X25F', 'filter', 'oem', '日立'),
  ('フィルター RAS-X25G', 'filter', 'oem', '日立'),
  ('フィルター RAS-X25H', 'filter', 'oem', '日立'),
  ('フィルター RAS-X25J', 'filter', 'oem', '日立'),
  ('フィルター RAS-X25K', 'filter', 'oem', '日立'),
  ('フィルター RAS-X25L', 'filter', 'oem', '日立'),
  ('フィルター RAS-X25LBK', 'filter', 'oem', '日立'),
  ('フィルター RAS-X28F', 'filter', 'oem', '日立'),
  ('フィルター RAS-X28G', 'filter', 'oem', '日立'),
  ('フィルター RAS-X28H', 'filter', 'oem', '日立'),
  ('フィルター RAS-X28J', 'filter', 'oem', '日立'),
  ('フィルター RAS-X28K', 'filter', 'oem', '日立'),
  ('フィルター RAS-X28L', 'filter', 'oem', '日立'),
  ('フィルター RAS-X28LBK', 'filter', 'oem', '日立'),
  ('フィルター RAS-X36F', 'filter', 'oem', '日立'),
  ('フィルター RAS-X36G', 'filter', 'oem', '日立'),
  ('フィルター RAS-X36H', 'filter', 'oem', '日立'),
  ('フィルター RAS-X36J', 'filter', 'oem', '日立'),
  ('フィルター RAS-X36K', 'filter', 'oem', '日立'),
  ('フィルター RAS-X36LBK', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC22F', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC22G', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC22H', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC22J', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC22K', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC22L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC25F', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC25G', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC25H', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC25J', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC25K', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC25L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC28F', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC28G', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC28H', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC28J', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC28K', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC28L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC36F', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC36G', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC36H', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC36J', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC36K', 'filter', 'oem', '日立'),
  ('フィルター RAS-XC36L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ22F', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ22G', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ22H', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ22J', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ22K', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ22L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ25F', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ25G', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ25H', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ25J', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ25K', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ25L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ28F', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ28G', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ28H', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ28J', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ28K', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ28L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ36F', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ36G', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ36H', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ36J', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ36K', 'filter', 'oem', '日立'),
  ('フィルター RAS-XJ36L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XK25G', 'filter', 'oem', '日立'),
  ('フィルター RAS-XK25H', 'filter', 'oem', '日立'),
  ('フィルター RAS-XK25J', 'filter', 'oem', '日立'),
  ('フィルター RAS-XK25K', 'filter', 'oem', '日立'),
  ('フィルター RAS-XK25L', 'filter', 'oem', '日立'),
  ('フィルター RAS-XK25M', 'filter', 'oem', '日立'),
  ('フィルター RAS-YZ28F', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ22H', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ22J', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ22K', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ22L', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ22M', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ22ME', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ25H', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ25J', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ25K', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ25L', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ25M', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ25ME', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ28H', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ28J', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ28K', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ28L', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ28M', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ28ME', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ36H', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ36J', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ36K', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ36L', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ36M', 'filter', 'oem', '日立'),
  ('フィルター RAS-ZJ36ME', 'filter', 'oem', '日立'),
  ('フィルター RAS-G22S', 'filter', 'oem', '日立'),
  ('フィルター RAS-G22T', 'filter', 'oem', '日立'),
  ('フィルター RAS-G25S', 'filter', 'oem', '日立'),
  ('フィルター RAS-G25T', 'filter', 'oem', '日立'),
  ('フィルター RAS-G28S', 'filter', 'oem', '日立'),
  ('フィルター RAS-G28T', 'filter', 'oem', '日立'),
  ('フィルター RAS-GT22T', 'filter', 'oem', '日立'),
  ('フィルター RAS-GT25T', 'filter', 'oem', '日立')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('フィルター RAS-GT28T', 'filter', 'oem', '日立'),
  ('フィルター RAS-GX22S', 'filter', 'oem', '日立'),
  ('フィルター RAS-GX25S', 'filter', 'oem', '日立'),
  ('フィルター RAS-GX28S', 'filter', 'oem', '日立'),
  ('フィルター RAS-GY22S', 'filter', 'oem', '日立'),
  ('フィルター RAS-GY22T', 'filter', 'oem', '日立'),
  ('フィルター RAS-GY25S', 'filter', 'oem', '日立'),
  ('フィルター RAS-GY25T', 'filter', 'oem', '日立'),
  ('フィルター RAS-GY28S', 'filter', 'oem', '日立'),
  ('フィルター RAS-GY28T', 'filter', 'oem', '日立'),
  ('フィルター RAS-GZ22S', 'filter', 'oem', '日立'),
  ('フィルター RAS-GZ22T', 'filter', 'oem', '日立'),
  ('フィルター RAS-GZ25S', 'filter', 'oem', '日立'),
  ('フィルター RAS-GZ25T', 'filter', 'oem', '日立'),
  ('フィルター RAS-GZ28S', 'filter', 'oem', '日立'),
  ('フィルター RAS-GZ28T', 'filter', 'oem', '日立'),
  ('フィルター RAS-GZ36T', 'filter', 'oem', '日立'),
  ('フィルター RAS-HJ22T', 'filter', 'oem', '日立'),
  ('フィルター RAS-HJ22V', 'filter', 'oem', '日立'),
  ('フィルター RAS-HJ25T', 'filter', 'oem', '日立'),
  ('フィルター RAS-HJ25V', 'filter', 'oem', '日立'),
  ('フィルター RAS-HJ28T', 'filter', 'oem', '日立'),
  ('フィルター RAS-HJ28V', 'filter', 'oem', '日立'),
  ('フィルター RAS-HJ36T', 'filter', 'oem', '日立'),
  ('フィルター RAS-HJ36V', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ22X', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ22Y', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ25X', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ25Y', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ28X', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ28Y', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ36X', 'filter', 'oem', '日立'),
  ('フィルター RAS-KJ36Y', 'filter', 'oem', '日立'),
  ('フィルター RAS-N22S', 'filter', 'oem', '日立'),
  ('フィルター RAS-N22T', 'filter', 'oem', '日立'),
  ('フィルター RAS-N25S', 'filter', 'oem', '日立'),
  ('フィルター RAS-N25T', 'filter', 'oem', '日立'),
  ('フィルター RAS-N28S', 'filter', 'oem', '日立'),
  ('フィルター RAS-N28T', 'filter', 'oem', '日立'),
  ('フィルター RAS-NF225', 'filter', 'oem', '日立'),
  ('フィルター RAS-NJ22T', 'filter', 'oem', '日立'),
  ('フィルター RAS-NJ25T', 'filter', 'oem', '日立'),
  ('フィルター RAS-NJ28T', 'filter', 'oem', '日立'),
  ('フィルター RAS-NJ28V', 'filter', 'oem', '日立'),
  ('フィルター RAS-NJ36T', 'filter', 'oem', '日立'),
  ('フィルター RAS-NJ36V', 'filter', 'oem', '日立'),
  ('フィルター RAS-WR4025D', 'filter', 'oem', '日立'),
  ('フィルター MSZ-HXV2517', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV2817S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV4017S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV5617S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV6317S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV250', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV280S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV400S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-HXV560S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV220', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV221', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV224', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV250', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV251', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV254', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV280', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV280S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV281', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV281S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV284', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV284S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV360', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV360S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV361', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV361S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV364', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV364S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV400S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV401S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV404S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV560S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV561S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-JXV564S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW220', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW229', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW250', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW259', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW289', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW360', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW369', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW400S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW409S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW509S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW560S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW630S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW710S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV220', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV229', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV250', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV259', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV280', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV280S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV289', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV289S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV360', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV360S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV369', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV369S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2221', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2521', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2821S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD3621S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD4021S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD5621S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD6321S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV2220', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV2520', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV2820S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV3620S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV4020S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV5620S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2220', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2520', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2820S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD3620S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD4020S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD5620S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD6320S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GV5625S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-AH2217', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-AH225', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-AH255', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-AH565S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV285S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV3618S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV365S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L2216', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L2217', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L225', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L2516', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L2517', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L255', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L2816', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L2817', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L285', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L3616', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L3617', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L365', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L4016S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L4017S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L405S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L5616S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L5617S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-L565S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK2216', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK2217', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK2218', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK2516', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK2517', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK2518', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK2816', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK2817', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK2818', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK3616', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK3617', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK3618', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK4016S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK4017S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK4018S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK5616S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK5617S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-LK5618S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV2217', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV2517', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV2817S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV3617S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV4017S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-NXV5617S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2217', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2218', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2517', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2518', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2817S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2818S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD2819', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD3617S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD3618S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD4017S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD4018S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD5617S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD5618S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD6317S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-XD6318S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-YL2517', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW253', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW364', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW403S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW563S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW564S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW713S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZW804S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV223', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV363', 'filter', 'oem', '三菱電機')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('フィルター MSZ-ZXV403S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV563S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV564S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV804S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV220', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV228', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV229', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV250', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV258', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV259', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV280', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV288', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV289', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV360', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV368', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV369', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV400S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV408S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV409S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV508S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV509S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-BXV560S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GR220', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GR250', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GR400S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GR560S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GS229', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GS259', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GS289', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GS369', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GS409S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GS509S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW228', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW258', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW259', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW288', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW289', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW368', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW369', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW408S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW409S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW508S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-GW509S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SS228', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SS258', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SS288', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SS368', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SS408S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SS508S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-SW407S', 'filter', 'oem', '三菱電機'),
  ('フィルター MSZ-ZXV408S', 'filter', 'oem', '三菱電機'),
  ('ターンテーブル NE-UBS10C', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS1600', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS651', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS802', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS806', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS902', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS903', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS908', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS1200', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS803', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS804', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS805', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS904', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS905', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS907', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS1100', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS1300', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS1400', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS2700', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS801', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-BS901', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル NE-CBS2700', 'turntable', 'oem', 'Panasonic'),
  ('ターンテーブル MRO-A4', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-EA4', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-SA4', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-X5', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-DV100', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-GV100', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-JV100', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-DS8', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-LS8', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-MS8', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-RS8', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-LS7', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-NF6', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-NV2000', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-RBK5000', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-RF6', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-RS7', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-SE1000', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-SV1000', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-SV2000', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-CS7', 'turntable', 'oem', '日立'),
  ('ターンテーブル MRO-MBK3000T', 'turntable', 'oem', '日立'),
  ('ターンテーブル ER-JD10', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JD10A', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-KD10', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-KK20', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-LD10', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-MD100', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-ND100', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-PD100', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-RD100', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-KSD100', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JZ1000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JZ2000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JZ3000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JZ4000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-JZ5000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-MD300', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-MD400', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-MD500', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-ND400', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-ND500', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-PD3000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-PD5000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-PD7000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-RD5000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-RD7000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-SD5000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-SD7000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-TD3000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-TD5000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-TD7000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-VD5000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-VD7000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-WD5000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル ER-WD7000', 'turntable', 'oem', '東芝'),
  ('ターンテーブル AX-CX1', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-GX1', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-GX3', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-HC3', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-HC4', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-HT2', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-HT3', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-MX2', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-MX3', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-PX3', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-LSX3B', 'turntable', 'oem', 'シャープ'),
  ('ターンテーブル AX-XA10', 'turntable', 'oem', 'シャープ'),
  ('製氷皿 NR-FTF556', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-ETR438', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F607XV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E438TG', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F503TE', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E438TGL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E414GV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E414V', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E414VL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E431V', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E507EX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E507EXL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F454HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F506HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F654HPX', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-SHF555X', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F472V', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F510PV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E431GV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F603WPV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E412PV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E412PVL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F552PV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F502PV', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-E401T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-B148W', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-B178W', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F468T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-C32DM', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-C32EM', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-C32EML', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-C371N', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-C371NL', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-C37EM', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-C37EML', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-FTF456', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-C371GN', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 NR-F455T', 'ice_tray', 'oem', 'Panasonic'),
  ('製氷皿 R-F440D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-F440E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-F480D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-F480E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-F480F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-F520D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-F520E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-F520F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G4800D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G4800E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G4800F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G5200D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G5200E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G5200F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G5700D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G5700E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G5700F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G6200D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-G6200E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-GS4800H', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-GS5100H', 'ice_tray', 'oem', '日立')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('製氷皿 R-M5700D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-M6200D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-M6700D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S4700D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S4700E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S4700F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S5000D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S5000E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S5000F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WX5600G', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WX6200G', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WX62J', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WX62K', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WX7400G', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WX74J', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WX74K', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WXC62N', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WXC62S', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-WXC74N', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-X5200E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-X5200F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-X5700E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-X5700F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-X6200D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-X6200E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-X6200F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG4800G', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG4800H', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG48J', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG48K', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG5100G', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG5100H', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG51J', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG5600G', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG56J', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG6200G', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-XG6200H', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-MW5700D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-Z5700', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-K40H', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-K42D', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-K42E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-K42F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S4000G', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S4000H', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S40J', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S40K', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S40N', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S40R', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S4200E', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-S4200F', 'ice_tray', 'oem', '日立'),
  ('製氷皿 R-C6200U', 'ice_tray', 'oem', '日立'),
  ('製氷皿 MR-B46E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MB45F', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MB45G', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MD45K', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MD45M', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX57F', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MX57G', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R46J', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX52F', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WXD70J', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-EX62S', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-R44A', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-P15E', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-MZ60H', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-B46G', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 MR-WX47G', 'ice_tray', 'oem', '三菱電機'),
  ('製氷皿 GR-A34N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A37G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A37GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A38N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A41G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A41GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A41N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A41NL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A43F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A47F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-A51R', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B33G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B34N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B37G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B37GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B38N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B41G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B41GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B41N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B41NL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B43F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B48F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B50F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-B55F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-C34N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-C38N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-C42NL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-C43F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-C43G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-C43GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-C56R', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-D43F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-D43N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-D47F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-D50F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-D55F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E34N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E38N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E43G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E43GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E43N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E47F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E50F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E50FX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E55F', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E55FX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-E62FX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-F43FS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-F43G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-F43GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-F43N', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-F48FX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-F51FXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-F56FXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-F62FX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G34S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G34SY', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G38S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G38SXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G38SY', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G43G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G43GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G48FS', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G48FX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-G51FX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H34S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H34SY', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H38S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H38SXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H38SXVL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H38SY', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H43G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H43GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H43GXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H43GXVE', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H43GXVEL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H43GXVL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H460FV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H510FV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H560FV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-H610FV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-J43G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-J43GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-J43GXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-J43GXVE', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-J43GXVEL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-J43GXVL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-K33S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-K33SXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-K33SXVL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-K36S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-K36SXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-K36SXVL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-K47FR', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M33S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M33SXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M33SXVL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M36S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M41G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M41GK', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M41GKL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M41GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M41GXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M41GXVL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M460FDE', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M470GW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M470GWL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M47FP', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-M47FX', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P41G', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P41GL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P41GXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P41GXVL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P460FD', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P460FW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P510FW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P550FW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P600FW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-P600FWA', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R33S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R36S', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R36SXV', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R36SXVL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R470GW', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R470GWL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R510FH', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R550FZ', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-R600FZ', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-T36GT', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-T36GTL', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-W42FT', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-W45FT', 'ice_tray', 'oem', '東芝')
on conflict do nothing;

insert into parts (name, category, kind, manufacturer) values
  ('製氷皿 GR-W50FT', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-X53FT', 'ice_tray', 'oem', '東芝'),
  ('製氷皿 GR-X56FT', 'ice_tray', 'oem', '東芝')
on conflict do nothing;

insert into appliance_parts (appliance_id, part_id, fitment_note)
select a.id, p.id, null
from parts p
join appliances a on p.name like '%' || a.model_number
where a.created_at > now() - interval '1 hour'
and not exists (
  select 1 from appliance_parts ap where ap.appliance_id = a.id and ap.part_id = p.id
);
-- Auto-generated by scripts/enrich-parts.ts
-- 2026-05-18T07:05:26.118Z

update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/avac/cabinet/img155/1.jpg?_ex=128x128' where name = 'ターンテーブル AX-X1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cocochi11/cabinet/shohin-1/1/no-image.jpg?_ex=128x128' where name = 'ターンテーブル MRO-CV200' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/upb-houseup/cabinet/common/no_image.jpg?_ex=128x128' where name = 'ターンテーブル MRO-FV100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cocochi11/cabinet/shohin-1/1/no-image.jpg?_ex=128x128' where name = 'ターンテーブル MRO-GV200' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cocochi11/cabinet/shohin-1/1/no-image.jpg?_ex=128x128' where name = 'ターンテーブル MRO-N550' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kyoto-serikawa/cabinet/racoon_24/db02-002b-1.jpg?_ex=128x128' where name = 'ターンテーブル NE-EH2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kyoto-serikawa/cabinet/racoon_24/db02-002b-1.jpg?_ex=128x128' where name = 'ターンテーブル NE-EH22' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kyoto-serikawa/cabinet/racoon_45/db08-009d-1.jpg?_ex=128x128' where name = 'ターンテーブル NE-EZ2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden4/a06011e60s.jpg?_ex=128x128' where name = 'ターンテーブル NE-M152' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/auc-goodtools/cabinet/imgrc0074971053.jpg?_ex=128x128' where name = 'バッテリー CL182FD' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden6/by5sc17.jpg?_ex=128x128' where name = 'バッテリー EC-A1R' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yuzuriha-shop/cabinet/r_2024052439/20240607004833_163_1.jpg?_ex=128x128' where name = 'バッテリー EC-AP700' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yuzuriha-shop/cabinet/r_2024052439/20240607004833_163_1.jpg?_ex=128x128' where name = 'バッテリー EC-AR2S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kaimonobiyori/cabinet/biiino/item/main-image-2/20230817192732_1.jpg?_ex=128x128' where name = 'バッテリー EC-AR5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden6/by5sc25.jpg?_ex=128x128' where name = 'バッテリー EC-AR7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/r-style-ra/cabinet/r_2023062314/20240606033909_67_1.jpg?_ex=128x128' where name = 'バッテリー EC-AR8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/wonder-depo/cabinet/13093900/34524185_1.jpg?_ex=128x128' where name = 'バッテリー EC-AR9' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yotsubasyouten/cabinet/r_2022081954/20240507213026_24_1.jpg?_ex=128x128' where name = 'バッテリー EC-AS710' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/victoryslife/cabinet/amayahoo/06606874/0615-022402.jpg?_ex=128x128' where name = 'バッテリー EC-FR10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/esco/cabinet/main/kaden2/ecfr11.jpg?_ex=128x128' where name = 'バッテリー EC-FR11' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/your-sales-shop/cabinet/0031/2b4ikk6j30_0.jpg?_ex=128x128' where name = 'バッテリー EC-FR7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/happynight/cabinet/g/17/e90j44trwi-2.jpg?_ex=128x128' where name = 'バッテリー EC-FR9' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden6/by7sc25s.jpg?_ex=128x128' where name = 'バッテリー EC-HR7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kai-shop/cabinet/r_2025012449/20250124221925_9_1.jpg?_ex=128x128' where name = 'バッテリー EC-HR8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/u-jinshop78/cabinet/g/4/e90j44trwi-2.jpg?_ex=128x128' where name = 'バッテリー EC-KR1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/pleasurebox/cabinet/10215118/10217336/imgrc0096466151.jpg?_ex=128x128' where name = 'バッテリー EC-KR2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden6/by7sc25s.jpg?_ex=128x128' where name = 'バッテリー EC-PR9' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/akindo/cabinet/l46/ec-sr11-b.jpg?_ex=128x128' where name = 'バッテリー EC-SR11' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/your-sales-shop/cabinet/0031/2b4ikk6j30_0.jpg?_ex=128x128' where name = 'バッテリー EC-SX200' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kaimonobiyori/cabinet/biiino/item/main-image-2/20230817192732_1.jpg?_ex=128x128' where name = 'バッテリー EC-SX210' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kaimonobiyori/cabinet/biiino/item/main-image-2/20230817192732_1.jpg?_ex=128x128' where name = 'バッテリー EC-SX310' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kaimonobiyori/cabinet/biiino/item/main-image-2/20230817192732_1.jpg?_ex=128x128' where name = 'バッテリー EC-SX320' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shop-and-und/cabinet/g/9/e9drp5rzx8-1.jpg?_ex=128x128' where name = 'バッテリー EC-SX520' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yotsubasyouten/cabinet/r_2022081954/20240507213026_24_1.jpg?_ex=128x128' where name = 'バッテリー EC-SX530' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/bearhomes/cabinet/11094738/2a669e8f56e2e7e.jpg?_ex=128x128' where name = 'バッテリー EC-VR3S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ipxstore/cabinet/pana/ava97v-1a.jpg?_ex=128x128' where name = 'バッテリー MC-PB60J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ipxstore/cabinet/pana/ava97v-1a.jpg?_ex=128x128' where name = 'バッテリー MC-SB33J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ipxstore/cabinet/pana/ava97v-1a.jpg?_ex=128x128' where name = 'バッテリー MC-SB34J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ipxstore/cabinet/pana/ava97v-1a.jpg?_ex=128x128' where name = 'バッテリー MC-SB53K' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ipxstore/cabinet/pana/ava97v-1a.jpg?_ex=128x128' where name = 'バッテリー MC-SB54K' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden2/pvbeh900009.jpg?_ex=128x128' where name = 'バッテリー PV-BEH800' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/donumshop/cabinet/09996320/10026501/imgrc0094421900.jpg?_ex=128x128' where name = 'バッテリー PV-BEH900' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/hitachi/hitachi2/pv-beh900009.jpg?_ex=128x128' where name = 'バッテリー PV-BEH900009' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden2/pvbeh900009.jpg?_ex=128x128' where name = 'バッテリー PV-BFH500' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/hitachi-nz/pv-bfh900-015.jpg?_ex=128x128' where name = 'バッテリー PV-BFH900' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/goldrab/cabinet/hitachi/mk1825/sm1.jpg?_ex=128x128' where name = 'バッテリー PV-BFL1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kis-japan/cabinet/battery/cleaner/pvb-1825a/pvb-1825a-top.jpg?_ex=128x128' where name = 'バッテリー PV-BFL1008' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden6/pvbh900h010b2.jpg?_ex=128x128' where name = 'バッテリー PV-BH500H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/donumshop/cabinet/09996320/10026501/imgrc0094421902.jpg?_ex=128x128' where name = 'バッテリー PV-BH900H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/hitachi-nz/pv-bh900k-006.jpg?_ex=128x128' where name = 'バッテリー PV-BH900K' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi1/imgrc0056547247.jpg?_ex=128x128' where name = 'バッテリー PV-BHL1000J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi1/imgrc0056547247.jpg?_ex=128x128' where name = 'バッテリー PV-BHL2000J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi1/imgrc0056547247.jpg?_ex=128x128' where name = 'バッテリー PV-BHL3000J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/bestar/cabinet/13261017/imgrc0116431280.jpg?_ex=128x128' where name = 'バッテリー PV-BKL11G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/bestar/cabinet/13261017/imgrc0116431280.jpg?_ex=128x128' where name = 'バッテリー PV-BKL11L' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kis-japan/cabinet/battery/cleaner/pvb-1825a/pvb-1825a-top.jpg?_ex=128x128' where name = 'バッテリー PV-BL10G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi1/imgrc0056547247.jpg?_ex=128x128' where name = 'バッテリー PV-BL1H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi1/imgrc0056547247.jpg?_ex=128x128' where name = 'バッテリー PV-BL20G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/bestar/cabinet/13261017/imgrc0116431280.jpg?_ex=128x128' where name = 'バッテリー PV-BL2H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/hitachi-nz/pv-bl30h-015.jpg?_ex=128x128' where name = 'バッテリー PV-BL30H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/andonya/cabinet/01152133/01216004/pv-beh900-009-1.jpg?_ex=128x128' where name = 'バッテリー PV-BL30J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi1/imgrc0056547247.jpg?_ex=128x128' where name = 'バッテリー PV-BL3J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/biccamera/cabinet/product/10584/00000012856914_a01.jpg?_ex=128x128' where name = 'バッテリー PV-BL3L' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/andonya/cabinet/01152133/01216004/pv-beh900-009-1.jpg?_ex=128x128' where name = 'バッテリー PV-BL50J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shopworld/cabinet/12440368/12440370/imgrc0180640512.jpg?_ex=128x128' where name = 'バッテリー PV-BL50M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/nextliving/cabinet/dyson/v11-1/v11-1_22.jpg?_ex=128x128' where name = 'バッテリー V11' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/homeshop/cabinet/cameraa20/5206-kak-0020_1.jpg?_ex=128x128' where name = 'バッテリー V12 Detect Slim' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/willgo/cabinet/thum/he-bat12goka101.jpg?_ex=128x128' where name = 'バッテリー V6 Absolute' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/nextliving/cabinet/dyson/v7/v7_25.jpg?_ex=128x128' where name = 'バッテリー V7 Absolute' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/goldrab/cabinet/dyson/ho3524/smw29.jpg?_ex=128x128' where name = 'バッテリー V8 Absolute' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shop-sedona/cabinet/products/dyson/dyson_parts/v8_battery.jpg?_ex=128x128' where name = 'バッテリー V8 Slim' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/donumshop/cabinet/10006860/imgrc0096692022.jpg?_ex=128x128' where name = 'フィルター AN28VES-W' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/donumshop/cabinet/10006860/imgrc0096692022.jpg?_ex=128x128' where name = 'フィルター AN28VESK-W' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/donumshop/cabinet/10006860/imgrc0096692022.jpg?_ex=128x128' where name = 'フィルター AN28WEBKS-W' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cecs02-2023/cabinet/10304798/12081506/glw-cz-saf4-zt001.jpg?_ex=128x128' where name = 'フィルター CS-X638C2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cocochi11/cabinet/shohin-1/1/no-image.jpg?_ex=128x128' where name = 'フィルター CS-X800D2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cecs02-2023/cabinet/10304798/12081506/glw-cz-saf4-zt001.jpg?_ex=128x128' where name = 'フィルター CS-XS229C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cecs02-2023/cabinet/10304798/12081506/glw-cz-saf14-2-zt001.jpg?_ex=128x128' where name = 'フィルター CS-XS289C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cecs02-2023/cabinet/10304798/12081506/glw-cz-saf14-2-zt001.jpg?_ex=128x128' where name = 'フィルター CS-XS289C2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cecs02-2023/cabinet/10304798/12081506/glw-cz-saf4-zt001.jpg?_ex=128x128' where name = 'フィルター CS-XS719C2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-BXV225' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-BXV255' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-BXV285' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-BXV365' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-BXV405S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-BXV565S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/airhope/cabinet/aircon_img/2025_room/mitsubishi/imgrc0110840328.jpg?_ex=128x128' where name = 'フィルター MSZ-GV5625S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-m2/m21eal100.jpg?_ex=128x128' where name = 'フィルター MSZ-L225' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-L255' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-L285' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-L365' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-L405S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/shininostore/cabinet/13002911/pic_10107366.jpg?_ex=128x128' where name = 'フィルター MSZ-L565S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l30/msz-zw2226-w-ko1.jpg?_ex=128x128' where name = 'フィルター MSZ-ZW222' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l30/msz-zw2526-w-ko1.jpg?_ex=128x128' where name = 'フィルター MSZ-ZW252' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l30/msz-zw2826s-w-ko1.jpg?_ex=128x128' where name = 'フィルター MSZ-ZW282' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-m2/m218g5100.jpg?_ex=128x128' where name = 'フィルター MSZ-ZW287' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l30/msz-zw3626s-w-ko2.jpg?_ex=128x128' where name = 'フィルター MSZ-ZW362' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-m2/m21ea0100.jpg?_ex=128x128' where name = 'フィルター MSZ-ZW633S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denchiya-bekkan/cabinet/hitachi/rasa22z123-sn.jpg?_ex=128x128' where name = 'フィルター RAS-A22Z' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kaden119-parts-store/cabinet/03106477/10483576/imgrc0078386741.jpg?_ex=128x128' where name = 'フィルター RAS-AJ22F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/hitachi/eakon/ras-aj40g2018_00.jpg?_ex=128x128' where name = 'フィルター RAS-AJ40G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l33/ras-mj4026d-w-ko2.jpg?_ex=128x128' where name = 'フィルター RAS-MJ4026D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l33/ras-mj7126d-w-ko3.jpg?_ex=128x128' where name = 'フィルター RAS-MJ7126D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/mainpic1/ras-n28v222.jpg?_ex=128x128' where name = 'フィルター RAS-N28V' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l33/ras-vj2226s-w-ko1.jpg?_ex=128x128' where name = 'フィルター RAS-VJ2226S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l33/ras-vj2526s-w-ko1.jpg?_ex=128x128' where name = 'フィルター RAS-VJ2526S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/auc-gion/cabinet/shopping264/ras-vj4025dwset.jpg?_ex=128x128' where name = 'フィルター RAS-VJ4025D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l33/ras-vj4026d-w-ko2.jpg?_ex=128x128' where name = 'フィルター RAS-VJ4026D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l29/ras-vl6325d-w-ko3.jpg?_ex=128x128' where name = 'フィルター RAS-VL6325D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/akindo/cabinet/l46/ras-vl7125d-w-ko3.jpg?_ex=128x128' where name = 'フィルター RAS-VL7125D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l33/ras-vl7126d-w-ko3.jpg?_ex=128x128' where name = 'フィルター RAS-VL7126D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/akindo/cabinet/l44/ras-wr4025d-w-set.jpg?_ex=128x128' where name = 'フィルター RAS-WR4025D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l33/ras-xj2226s-w-ko1.jpg?_ex=128x128' where name = 'フィルター RAS-XJ2226S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l30/ras-xr2826s-w-set.jpg?_ex=128x128' where name = 'フィルター RAS-XR2826S' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/f092037-tochigi/cabinet/frp_goods/frp008/25158898.jpg?_ex=128x128' where name = 'フィルター RAS-XR4026D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ecoeur555/cabinet/11975607/1.jpg?_ex=128x128' where name = 'リモコン RAS-D40K' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/44066330.jpg?_ex=128x128' where name = '上冷凍室ドアパッキン GR-T550FZ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/44066331.jpg?_ex=128x128' where name = '下冷凍室ドアパッキン GR-T550FZ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/pikatto/cabinet/parts/2103370527.jpg?_ex=128x128', manufacturer_part_number = '2103370527' where name = '乾燥フィルター ES-W113' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1axw003wa0xt0/pn1axw003wa0xt0-08.jpg?_ex=128x128', manufacturer_part_number = 'AXW003WA0XT0' where name = '乾燥フィルター NA-VX900AL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/zaka-mmc/cabinet/zobhin/imgrc0092204673.jpg?_ex=128x128' where name = '内ぶた NP-RY05' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l5/jpb1682.jpg?_ex=128x128' where name = '内釜 JPB-R180W' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-m1/m15w59340.jpg?_ex=128x128', manufacturer_part_number = 'M15W59340' where name = '内釜 NJ-AW108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/andonya/cabinet/01071771/05758548/imgrc0117894146.jpg?_ex=128x128', manufacturer_part_number = 'M15X86340' where name = '内釜 NJ-BW10G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/murauchi-denki/cabinet/m2/01122/4902901972263.jpg?_ex=128x128' where name = '内釜 NJ-BW10H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dejikura/cabinet/ir031/4573637012952.jpg?_ex=128x128' where name = '内釜 NJ-SE06H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-m1/m15x34340.jpg?_ex=128x128', manufacturer_part_number = 'M15X34340' where name = '内釜 NJ-SV06R' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/andonya/cabinet/01071771/05758548/m15w75340-1.jpg?_ex=128x128', manufacturer_part_number = 'NJ-SW066' where name = '内釜 NJ-SW065' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/andonya/cabinet/01071771/05758548/m15w75340-1.jpg?_ex=128x128', manufacturer_part_number = 'NJ-SW065' where name = '内釜 NJ-SW066' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/andonya/cabinet/01071771/05758548/m15w75340-1.jpg?_ex=128x128', manufacturer_part_number = 'NJ-SW065' where name = '内釜 NJ-SW067' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/andonya/cabinet/01071771/05758548/m15w75340-1.jpg?_ex=128x128', manufacturer_part_number = 'NJ-SW065' where name = '内釜 NJ-SW068' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-m1/m15w75340.jpg?_ex=128x128', manufacturer_part_number = 'M15W75340' where name = '内釜 NJ-SW069' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/mitsubishi-m1/m15x32340.jpg?_ex=128x128', manufacturer_part_number = 'M15X32340' where name = '内釜 NJ-SWB06' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/mitsubishi/m15x32340.jpg?_ex=128x128', manufacturer_part_number = 'NJ-SWB06' where name = '内釜 NJ-SWD06' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/mitsubishi/m15w40340.jpg?_ex=128x128', manufacturer_part_number = 'M15W40340' where name = '内釜 NJ-VW107' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mitenekakakubamboo/cabinet/01113299/0216.jpg?_ex=128x128', manufacturer_part_number = 'M15W60340' where name = '内釜 NJ-VW108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mitenekakakubamboo/cabinet/01113299/0216.jpg?_ex=128x128', manufacturer_part_number = 'M15W77340' where name = '内釜 NJ-VW109' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b513-6b.jpg?_ex=128x128', manufacturer_part_number = 'B513-6B' where name = '内釜 NP-BG10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mustblanche/cabinet/item/zof/pic/zof-b513-6b_1.jpg?_ex=128x128', manufacturer_part_number = 'B513-6B' where name = '内釜 NP-BH10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b513-6b.jpg?_ex=128x128', manufacturer_part_number = 'B513-6B' where name = '内釜 NP-BJ10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/bear-hands/cabinet/shouhin02/imgrc0080395560.jpg?_ex=128x128', manufacturer_part_number = 'B434-6B' where name = '内釜 NP-HQ10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kadecoco/cabinet/buhin/b620-6b.jpg?_ex=128x128', manufacturer_part_number = 'B620-6B' where name = '内釜 NP-RT05' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sumai-rt/cabinet/kaden7/np-ru05-bz.jpg?_ex=128x128' where name = '内釜 NP-RU05' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b411-6b.jpg?_ex=128x128', manufacturer_part_number = 'B411-6B' where name = '内釜 NP-VD10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b411-6b.jpg?_ex=128x128', manufacturer_part_number = 'B412-6B' where name = '内釜 NP-VD18' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b411-6b.jpg?_ex=128x128', manufacturer_part_number = 'B411-6B' where name = '内釜 NP-VI10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b411-6b.jpg?_ex=128x128', manufacturer_part_number = 'B411-6B' where name = '内釜 NP-VL10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b411-6b.jpg?_ex=128x128', manufacturer_part_number = 'B411-6B' where name = '内釜 NP-VN10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b411-6b.jpg?_ex=128x128', manufacturer_part_number = 'B411-6B' where name = '内釜 NP-VZ10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/a-price/cabinet/orj/32/0-4974305221667.jpg?_ex=128x128', manufacturer_part_number = 'B627-6B' where name = '内釜 NW-CA10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kadecoco/cabinet/buhin/b629-6b.jpg?_ex=128x128', manufacturer_part_number = 'B629-6B' where name = '内釜 NW-FA10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kadecoco/cabinet/buhin/b630-6b.jpg?_ex=128x128', manufacturer_part_number = 'B630-6B' where name = '内釜 NW-FA18' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emon-shop/cabinet/l20/nw-fb18-wz.jpg?_ex=128x128', manufacturer_part_number = 'B630-6B' where name = '内釜 NW-FB18' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sommelier/cabinet/0000/default/s1/goods-01663_s1.jpg?_ex=128x128' where name = '内釜 NW-NB10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/bellevie-harima/cabinet/0000/default/s1/goods-01664_s1.jpg?_ex=128x128' where name = '内釜 NW-NB18' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kadecoco/cabinet/buhin/b577-6b.jpg?_ex=128x128', manufacturer_part_number = 'B577-6B' where name = '内釜 NW-PS10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kaichouseikatsu/cabinet/to009/4974305168092_1.jpg?_ex=128x128', manufacturer_part_number = 'B577-6B' where name = '内釜 NW-PT10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/bellevie-harima/cabinet/0000/default/s1/goods-01461_s1.jpg?_ex=128x128' where name = '内釜 NW-QA10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/bellevie-harima/cabinet/0000/default/s1/goods-01462_s1.jpg?_ex=128x128' where name = '内釜 NW-QA18' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/bellevie-harima/cabinet/0000/default/s1/goods-01113_s1.jpg?_ex=128x128', manufacturer_part_number = 'B551-6B' where name = '内釜 NW-SB10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sommelier/cabinet/0000/default/s1/goods-01676_s1.jpg?_ex=128x128', manufacturer_part_number = 'B668-6B' where name = '内釜 NW-UT07' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b411-6b.jpg?_ex=128x128', manufacturer_part_number = 'B411-6B' where name = '内釜 NW-VA10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/crown-musen/cabinet/zojirushi/b411-6b.jpg?_ex=128x128', manufacturer_part_number = 'B412-6B' where name = '内釜 NW-VA18' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sommelier/cabinet/0000/default/s1/goods-01666_s1.jpg?_ex=128x128', manufacturer_part_number = 'B673-6B' where name = '内釜 NW-WA18' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/emedama/cabinet/4224/4974305224224_1.jpg?_ex=128x128', manufacturer_part_number = 'B635-6B' where name = '内釜 NW-YA10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/toshiba/320ww280.jpg?_ex=128x128', manufacturer_part_number = 'RC-108VSSRC' where name = '内釜 RC-108VSS' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/toshiba/320ww280.jpg?_ex=128x128', manufacturer_part_number = 'RC-108VSSRC' where name = '内釜 RC-109VSS' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/3200c071.jpg?_ex=128x128' where name = '内釜 RC-10MSL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/toshiba/320ww280.jpg?_ex=128x128', manufacturer_part_number = 'RC-108VSSRC' where name = '内釜 RC-10VRL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/toshiba/320ww280.jpg?_ex=128x128', manufacturer_part_number = 'RC-108VSSRC' where name = '内釜 RC-10VRM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww301.jpg?_ex=128x128', manufacturer_part_number = 'RC-10VRR' where name = '内釜 RC-10VRP' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww301.jpg?_ex=128x128', manufacturer_part_number = 'RC-10VRP' where name = '内釜 RC-10VRR' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/toshiba/320ww280.jpg?_ex=128x128', manufacturer_part_number = 'RC-108VSSRC' where name = '内釜 RC-10VSL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/toshiba/320ww280.jpg?_ex=128x128', manufacturer_part_number = 'RC-108VSSRC' where name = '内釜 RC-10VSM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww301.jpg?_ex=128x128', manufacturer_part_number = 'RC-10VRP' where name = '内釜 RC-10VSP' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww301.jpg?_ex=128x128', manufacturer_part_number = 'RC-10VRP' where name = '内釜 RC-10VSR' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/toshiba/320ww292.jpg?_ex=128x128' where name = '内釜 RC-10VXM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/toshiba/320ww297.jpg?_ex=128x128' where name = '内釜 RC-10VXN' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww281.jpg?_ex=128x128', manufacturer_part_number = 'RC-189VSS' where name = '内釜 RC-188VSS' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww281.jpg?_ex=128x128', manufacturer_part_number = 'RC-188VSS' where name = '内釜 RC-189VSS' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww283.jpg?_ex=128x128', manufacturer_part_number = 'RC-18VQM' where name = '内釜 RC-18VQL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww283.jpg?_ex=128x128', manufacturer_part_number = 'RC-18VQL' where name = '内釜 RC-18VQM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww281.jpg?_ex=128x128', manufacturer_part_number = 'RC-188VSS' where name = '内釜 RC-18VRL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww281.jpg?_ex=128x128', manufacturer_part_number = 'RC-188VSS' where name = '内釜 RC-18VRM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww281.jpg?_ex=128x128', manufacturer_part_number = 'RC-188VSS' where name = '内釜 RC-18VRN' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww281.jpg?_ex=128x128', manufacturer_part_number = 'RC-188VSS' where name = '内釜 RC-18VSL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww281.jpg?_ex=128x128', manufacturer_part_number = 'RC-188VSS' where name = '内釜 RC-18VSM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/320ww281.jpg?_ex=128x128', manufacturer_part_number = 'RC-188VSS' where name = '内釜 RC-18VSN' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/s-oasis/cabinet/003/00023369.jpg?_ex=128x128', manufacturer_part_number = 'RC-6XK' where name = '内釜 RC-6XJ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/s-oasis/cabinet/003/00023369.jpg?_ex=128x128', manufacturer_part_number = 'RC-6XJ' where name = '内釜 RC-6XK' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/s-oasis/cabinet/003/00023369.jpg?_ex=128x128', manufacturer_part_number = 'RC-6XJ' where name = '内釜 RC-6XL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/s-oasis/cabinet/003/00023369.jpg?_ex=128x128', manufacturer_part_number = 'RC-6XJ' where name = '内釜 RC-6XM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/partscomstore/cabinet/shohin01/hitachi/hi003001/rz-ac10m-001.jpg?_ex=128x128' where name = '内釜 RZ-AC10M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/kaden119-parts-store/cabinet/03147977/imgrc0079936486.jpg?_ex=128x128' where name = '内釜 RZ-BV100M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/auc-denkamura/cabinet/imgrc0068399147.jpg?_ex=128x128' where name = '内釜 RZ-FZ10J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi/rz-hf10e5j-001.jpg?_ex=128x128' where name = '内釜 RZ-SD10KSJ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/hitachi/hitachi2/rz-sx100j001.jpg?_ex=128x128' where name = '内釜 RZ-SX100J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi/rz-hf10e5j-001.jpg?_ex=128x128' where name = '内釜 RZ-TD10KSJ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi1/rz-ts180m-001.jpg?_ex=128x128' where name = '内釜 RZ-TS180M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/santecdirect/cabinet/94/rz-wg10m-008.jpg?_ex=128x128' where name = '内釜 RZ-WG10M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/hitachi/rz-yv100m-001.jpg?_ex=128x128' where name = '内釜 RZ-WV100M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/hitachi-nz/rz-yw3000m-001.jpg?_ex=128x128' where name = '内釜 RZ-WW3000M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/hitachi/rz-jp10j001_01.jpg?_ex=128x128' where name = '内釜 RZ-XC10M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/hitachi/cho/rz-yv100m001_00.jpg?_ex=128x128' where name = '内釜 RZ-YV100M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/hitachi/hitachi2/rz-yw3000m001.jpg?_ex=128x128' where name = '内釜 RZ-YW3000M' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m19/pn1are50m19-20.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-M19' where name = '内釜 SR-CVSX180' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50j58/pn1are50j58-16.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-J58' where name = '内釜 SR-HB100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/07845696/pn1are50f85-14.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-F85' where name = '内釜 SR-HB104' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-j58.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-J581' where name = '内釜 SR-HB107' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-j58.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-J581' where name = '内釜 SR-HB108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50j58/pn1are50j58-16.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-J58' where name = '内釜 SR-HB109' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/national/are50-j58.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-J58' where name = '内釜 SR-HBA101' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-j56.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-J561' where name = '内釜 SR-HX100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-j56.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-J561' where name = '内釜 SR-HX107' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-j56.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-J561' where name = '内釜 SR-HX108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-j56.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-J561' where name = '内釜 SR-HX109' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/07890215/pn1are50h27-02.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H27' where name = '内釜 SR-HX185' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-h27.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H27' where name = '内釜 SR-HX186' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/07898445/pn1are50h83-01.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H83' where name = '内釜 SR-JX056' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-l48.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L481' where name = '内釜 SR-MPB100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-l72.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L72' where name = '内釜 SR-MPW100' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-l72.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L72' where name = '内釜 SR-MPW101' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-l72.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L72' where name = '内釜 SR-MPW102' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50l461/pn1are50l461-200.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L461' where name = '内釜 SR-PA106' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50l461/pn1are50l461-200.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L461' where name = '内釜 SR-PA107' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50l461/pn1are50l461-200.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L461' where name = '内釜 SR-PA108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50l461/pn1are50l461-200.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L461' where name = '内釜 SR-PA109' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50l481/pn1are50l481-100.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L481' where name = '内釜 SR-PB106' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-l48.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L481' where name = '内釜 SR-PB107' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50l481/pn1are50l481-100.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L481' where name = '内釜 SR-PB108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50l481/pn1are50l481-100.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-L481' where name = '内釜 SR-PB109' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/07914470/pn1are50b65-01.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-B65' where name = '内釜 SR-PGA54' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden2/are50b65.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-B65' where name = '内釜 SR-PGA54A' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/meicho/cabinet/yhnedit/ebbuhin.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-B65' where name = '内釜 SR-PGB54' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/meicho/cabinet/yhnedit/ebbuhin.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-B65' where name = '内釜 SR-PGB54P' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/07914470/pn1are50b65-01.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-B65' where name = '内釜 SR-PGC54' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-h04.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H04' where name = '内釜 SR-PW106' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-h04.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H04' where name = '内釜 SR-PW107' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50k13/pn1are50k13-02.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-K13' where name = '内釜 SR-PW108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50k12/pn1are50k12-10.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-K12' where name = '内釜 SR-PW188' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-e79.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-E79' where name = '内釜 SR-SA182' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/07890830/pn1are50e79.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-E79' where name = '内釜 SR-SB182' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/07901405/pn1are50h04-20.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H04' where name = '内釜 SR-SPA106' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/07901405/pn1are50h04-20.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H04' where name = '内釜 SR-SPA107' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50k13/pn1are50k13-02.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-K13' where name = '内釜 SR-SPA108' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50k12/pn1are50k12-10.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-K12' where name = '内釜 SR-SPA188' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50h42/pn1are50h42-20.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H42' where name = '内釜 SR-SPX107' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50g99/pn1are50g99-01.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-G99' where name = '内釜 SR-SPX186' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50h41/pn1are50h41-20.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H41' where name = '内釜 SR-SPX187' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-h26.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H26' where name = '内釜 SR-SY105J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-h26.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-H26' where name = '内釜 SR-SY106J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/masutakadenki/cabinet/parts/are50-m20.jpg?_ex=128x128' where name = '内釜 SR-VSX101（後継）' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m19/pn1are50m19-20.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-M19' where name = '内釜 SR-VSX180' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m19/pn1are50m19-20.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-M19' where name = '内釜 SR-VSX181' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m19/pn1are50m19-20.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-M19' where name = '内釜 SR-VSX188' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/2cube02/cabinet/pn1are50m19/pn1are50m19-20.jpg?_ex=128x128', manufacturer_part_number = 'ARE50-M19' where name = '内釜 SR-VSX189' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/luminous81023/cabinet/onesell0054/rumd3f96c41ad.jpg?_ex=128x128', manufacturer_part_number = '42044776' where name = '糸くずフィルター AW-10M7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/nice-color/cabinet/itemgazou/gazou2/s20019.jpg?_ex=128x128', manufacturer_part_number = '42044849' where name = '糸くずフィルター AW-10SD6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/nice-color/cabinet/itemgazou/gazou2/s20019.jpg?_ex=128x128', manufacturer_part_number = '42044849' where name = '糸くずフィルター AW-10SD7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-10SV5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-10SV6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-10SVE4' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-10SVE5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/morro/cabinet/r_2024080458/20240928043919_94_1.jpg?_ex=128x128', manufacturer_part_number = '42044776' where name = '糸くずフィルター AW-45M5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/primeplus/cabinet/r_2024100401/20250723140126_39_1.jpg?_ex=128x128', manufacturer_part_number = '42044776' where name = '糸くずフィルター AW-45M7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1361/58078133360_1.jpg?_ex=128x128', manufacturer_part_number = '42044776' where name = '糸くずフィルター AW-45M9' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-50GM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-5G2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ohstore/cabinet/0164/2b9xwrv0h8_0.jpg?_ex=128x128', manufacturer_part_number = '42044639' where name = '糸くずフィルター AW-60GE' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ohstore/cabinet/0164/2b9xwrv0h8_0.jpg?_ex=128x128', manufacturer_part_number = '42044639' where name = '糸くずフィルター AW-60GF' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-60GL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-60GM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/royal36719/cabinet/n20260115124512/b0fg8611nd-1.jpg?_ex=128x128' where name = '糸くずフィルター AW-60SDC' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ps-direct/cabinet/r_2024071120/20240711183340_74_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-6D6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1361/58078133360_1.jpg?_ex=128x128', manufacturer_part_number = '42044776' where name = '糸くずフィルター AW-6DH1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1360/58078133359_1.jpg?_ex=128x128', manufacturer_part_number = '42044776' where name = '糸くずフィルター AW-6DH2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ps-direct/cabinet/r_2024071120/20240711183340_74_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-6G2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/royal36719/cabinet/n20260115124512/b0fg8611nd-1.jpg?_ex=128x128' where name = '糸くずフィルター AW-70DC' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-70DF' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-70DL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ohstore/cabinet/0164/2b9xwrv0h8_0.jpg?_ex=128x128', manufacturer_part_number = '42044639' where name = '糸くずフィルター AW-70GF' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-70GL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-70GM' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/royal36719/cabinet/n20260115124512/b0fg8611nd-1.jpg?_ex=128x128' where name = '糸くずフィルター AW-70VC' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-7D5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-7D6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/42044831-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-7D7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-7DE4' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1361/58078133360_1.jpg?_ex=128x128', manufacturer_part_number = '42044776' where name = '糸くずフィルター AW-7DH1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/horiku/cabinet/0386/2bjd8oq1vw_0.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-7G5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ps-direct/cabinet/r_2024071120/20240711183340_74_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-7G6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/horiku/cabinet/0386/2bjd8oq1vw_0.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-7G8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/royal36719/cabinet/n20260115124512/b0fg8611nd-1.jpg?_ex=128x128' where name = '糸くずフィルター AW-80DC' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-80DL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/royal36719/cabinet/n20260115124512/b0fg8611nd-1.jpg?_ex=128x128' where name = '糸くずフィルター AW-80VC' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-80VF' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1357/58078133356_1.jpg?_ex=128x128', manufacturer_part_number = '42044698' where name = '糸くずフィルター AW-80VL' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-8D5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-8D6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-8D7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-8DE4' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-8V5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-8V6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-8V7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-8VE6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-9SV5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-9SV6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-9SVE4' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-9SVE5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-9V5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-9V6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-9V7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/toshiba/420-44-831-2ko-top.jpg?_ex=128x128', manufacturer_part_number = '42044831' where name = '糸くずフィルター AW-9VE6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/005/4902530008210-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-CSD7TV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/mainpic10/bw-d9wv001.jpg?_ex=128x128' where name = '糸くずフィルター BW-D10TV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/upb-houseup/cabinet/hitachi/2020/bw-d10wv-043.jpg?_ex=128x128' where name = '糸くずフィルター BW-D10WV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/partscomstore/cabinet/shohin01/hitachi/hi000001/bw-d10xtv-001.jpg?_ex=128x128' where name = '糸くずフィルター BW-D10XTV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4902530098600-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D11XWV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D6LV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D6MV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D6PV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D7' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D7FV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D7LV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D7MV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D7PV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/biccamera/cabinet/product/10599/00000012399664_a01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D7SV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8FV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8GV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8HV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8JV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8KV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8LV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8MV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4902530852059-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8PV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/tantan/cabinet/410/410370.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8SV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1320/58075689319_1.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8TV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ansinnoyosi/cabinet/12340048/imgrc0110932421.jpg?_ex=128x128' where name = '糸くずフィルター BW-D8WV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/tantan/cabinet/410/410370.jpg?_ex=128x128' where name = '糸くずフィルター BW-D9SV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/upb-houseup/cabinet/hitachi/2021/bw-d9wv-001.jpg?_ex=128x128' where name = '糸くずフィルター BW-D9WV' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873114118-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DBK100F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4549873054711-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DBK70C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873116372-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DKX120F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873116372-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DKX120G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/itokuzu/m-lin9sv-4ko.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV100A' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4549873054711-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV100C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4549873054711-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV100E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4549873054704-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV120C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4549873054704-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV120E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/happynight/cabinet/g/18/e9dnqqoat3-1.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV80A' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/happynight/cabinet/g/18/e9dnqqoat3-1.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV80B' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4549873054711-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV80C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4549873054711-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV80E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/edion/cabinet/goods/ll/img_208/4549873114118_ll.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV80F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873114118-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV80G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4549873054711-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV90C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4549873054711-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV90E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cathy-b/cabinet/hitachi/bw-dv9f-081.jpg?_ex=128x128' where name = '糸くずフィルター BW-DV9F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873114118-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DX100F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4902530098600-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DX110A' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4902530098600-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DX120B' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4549873054704-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DX120C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/002/4549873054704-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DX120E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873116372-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DX120F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873116372-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DX120G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873114118-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-DX90F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/chack0605/cabinet/skypiea/skypiea_0018/1773802008_00_1.jpg?_ex=128x128' where name = '糸くずフィルター BW-KSV100C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/rukusu/cabinet/images/junbi.jpg?_ex=128x128' where name = '糸くずフィルター BW-V100A' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/chack0605/cabinet/skypiea/skypiea_0018/1773802008_00_1.jpg?_ex=128x128' where name = '糸くずフィルター BW-V100C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/chack0605/cabinet/skypiea/skypiea_0018/1773802008_00_1.jpg?_ex=128x128' where name = '糸くずフィルター BW-V100CJ' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873153292-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-V100J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/chack0605/cabinet/skypiea/skypiea_0018/1773802008_00_1.jpg?_ex=128x128' where name = '糸くずフィルター BW-V70C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/asahigoudougayisya/cabinet/11125255/11447846/imgrc0209726629.jpg?_ex=128x128' where name = '糸くずフィルター BW-V70G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873153292-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-V70H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/chack0605/cabinet/skypiea/skypiea_0018/1773802008_00_1.jpg?_ex=128x128' where name = '糸くずフィルター BW-V80C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873153292-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-V80H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/chack0605/cabinet/skypiea/skypiea_0018/1773802008_00_1.jpg?_ex=128x128' where name = '糸くずフィルター BW-V90C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/edion/cabinet/goods/ll/img_208/4549873114125_ll.jpg?_ex=128x128' where name = '糸くずフィルター BW-V90F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/biccamera/cabinet/product/10599/00000012399738_a01.jpg?_ex=128x128' where name = '糸くずフィルター BW-X100F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873153292-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-X100H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873153292-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-X100J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873116372-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-X120F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873116372-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-X120G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4549873153292-01.jpg?_ex=128x128' where name = '糸くずフィルター BW-X90H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/004/4901087223435-01.jpg?_ex=128x128', manufacturer_part_number = '2103370490' where name = '糸くずフィルター ES-A70E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/smile-career/cabinet/211876/70130514_img_0.jpg?_ex=128x128' where name = '糸くずフィルター ES-D7C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ohstore/cabinet/0165/2bj3ck04ls_0.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-F556' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ohstore/cabinet/0165/2bj3ck04ls_0.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-FG55' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ohstore/cabinet/0165/2bj3ck04ls_0.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-FG55J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/854/58078132853_1.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-FG75' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/854/58078132853_1.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-GE55K' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/854/58078132853_1.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-GE55L' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/msshokai/cabinet/item/001/4974019221670-01.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE55N' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/854/58078132853_1.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-GE60K' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/854/58078132853_1.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-GE60L' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/seisinr01/cabinet/13276802/13276822/imgrc0122871878.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE60P' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/primeplus/cabinet/r_2023021737/20241224132118_39_1.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE60R' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/itokuzu/mokku-lp1-lp2/mokku-lp2-1ko.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE6C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/primeplus/cabinet/r_2023021737/20241224132118_39_1.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE6D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1370/58078133369_1.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-GE6G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/220/58080722219_1.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE70P' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/220/58080722219_1.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE70R' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/itokuzu/mokku-lp1-lp2/mokku-lp2-1ko.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE7A' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/royal36719/cabinet/n20250927141254/b0fk5pr115-1.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE7B' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/220/58080722219_1.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE7C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/220/58080722219_1.jpg?_ex=128x128' where name = '糸くずフィルター ES-GE7D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1370/58078133369_1.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-GE7F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/itokuzu/mokku-lp1-lp2/mokku-lp2-1ko.jpg?_ex=128x128' where name = '糸くずフィルター ES-GV10E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mlinestore/cabinet/0311/2b94vf6djo_0.jpg?_ex=128x128' where name = '糸くずフィルター ES-GV8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/royal36719/cabinet/n20250927141254/b0fk5pr115-1.jpg?_ex=128x128' where name = '糸くずフィルター ES-GV8C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/attrape/cabinet/biiino/item/main-image-2/20251203122323_1.jpg?_ex=128x128' where name = '糸くずフィルター ES-GV8D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1370/58078133369_1.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-GV8E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/itokuzu/mokku-lp1-lp2/mokku-lp2-1ko.jpg?_ex=128x128' where name = '糸くずフィルター ES-GV9' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/itokuzu/mokku-lp1-lp2/mokku-lp2-1ko.jpg?_ex=128x128' where name = '糸くずフィルター ES-GV9B' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/seisinr01/cabinet/13276802/13276822/imgrc0122871878.jpg?_ex=128x128' where name = '糸くずフィルター ES-GV9D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1370/58078133369_1.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-KS70' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1370/58078133369_1.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-KS70V' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ernest/cabinet/default/sonota/zfs-005_1_3_2.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-LP1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/thinkrich/cabinet/sale2_muryou_23/s23341.jpg?_ex=128x128' where name = '糸くずフィルター ES-LP2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ernest/cabinet/default/sonota/zfs-006_1_3.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-LT1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1370/58078133369_1.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-PH8C' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mokku-store/cabinet/itokuzu/mokku-lp1-lp2/mokku-lp2-1ko.jpg?_ex=128x128' where name = '糸くずフィルター ES-PW10D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1370/58078133369_1.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-PW11G' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1370/58078133369_1.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-PW11H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mlinestore/cabinet/0311/2b94vf6djo_0.jpg?_ex=128x128' where name = '糸くずフィルター ES-PX8E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/smile-career/cabinet/211876/70130514_img_0.jpg?_ex=128x128' where name = '糸くずフィルター ES-TG55F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ohstore/cabinet/0165/2bj3ck04ls_0.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-TG55L' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/horiku/cabinet/0032/2bjd6pov9h_0.jpg?_ex=128x128' where name = '糸くずフィルター ES-TX5D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/clearstore2024/cabinet/10862082/28207687_0.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-TX73' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mlinestore/cabinet/0311/2b94vf6djo_0.jpg?_ex=128x128' where name = '糸くずフィルター ES-TX8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/primeplus/cabinet/r_2023021737/20241224132118_39_1.jpg?_ex=128x128' where name = '糸くずフィルター ES-TX840' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/ar-store/cabinet/n20250902132610/b0fgcb16dk-1.jpg?_ex=128x128', manufacturer_part_number = '2103370483' where name = '糸くずフィルター ES-TX8A' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/tamtamshop/cabinet/g/0/e9dsxe35ao-1.jpg?_ex=128x128' where name = '糸くずフィルター ES-TX8B' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/primeplus/cabinet/r_2023021737/20241224132118_39_1.jpg?_ex=128x128' where name = '糸くずフィルター ES-TX8E' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/clearstore2024/cabinet/10862082/28207687_0.jpg?_ex=128x128', manufacturer_part_number = '2103370413' where name = '糸くずフィルター ES-U80D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden5/axw022aa5e00.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-F10WE8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/thinkrich/cabinet/sale2_muryou_05/s05346.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F503K' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/payoff/cabinet/sale3_muryou_00/b00289.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F504K' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F50B10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/happynight/cabinet/g/11/e9zdn6cxua-1.jpg?_ex=128x128' where name = '糸くずフィルター NA-F50B11' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1369/58078133368_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-F50B14' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1369/58078133368_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-F50B15' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/payoff/cabinet/sale3_muryou_00/b00289.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F50B2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/thinkrich/cabinet/sale2_muryou_05/s05346.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F50B3' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F50B9' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/happynight/cabinet/g/11/e9zdn6cxua-1.jpg?_ex=128x128' where name = '糸くずフィルター NA-F50BE5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sinseikatsukaden/cabinet/12380300/ht0728_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-F5B2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/happynight/cabinet/g/11/e9zdn6cxua-1.jpg?_ex=128x128' where name = '糸くずフィルター NA-F60B10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/happynight/cabinet/g/11/e9zdn6cxua-1.jpg?_ex=128x128' where name = '糸くずフィルター NA-F60B11' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden/axw22a8sr0.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F60PB8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F70BE5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/createlabo/cabinet/g/11/e9ganqr3jk-1.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F70PB10' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/createlabo/cabinet/g/11/e9ganqr3jk-1.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F70PB11' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sinseikatsukaden/cabinet/12380300/ht0728_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-F70PB15' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sinseikatsukaden/cabinet/12380300/ht0728_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-F7B2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1369/58078133368_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-F7PB1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sinseikatsukaden/cabinet/12380300/ht0728_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-F7PB2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F8AE3' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F8AE5' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden/axw22a9mb0.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F9AE3' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/createlabo/cabinet/g/11/e9ganqr3jk-1.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-F9AE6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/iiseikatsuzakka/cabinet/211876/70129961_img_0.jpg?_ex=128x128' where name = '糸くずフィルター NA-F9WE8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-FA120V1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/createlabo/cabinet/g/11/e9dg8hef8w-1.jpg?_ex=128x128' where name = '糸くずフィルター NA-FA70H2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-FA70H3' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sinseikatsukaden/cabinet/12380300/ht0728_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-FA7H2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden/axw22a9mb0.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-FA80H2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-FA80H6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/sinseikatsukaden/cabinet/12380300/ht0728_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-FA8H2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden/axw22a8sr0.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-FA90H1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden/axw22a9mb0.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-FA90H2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-FA90H6' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1369/58078133368_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-FA90H8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1369/58078133368_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-FA90H9' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1369/58078133368_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-FA9K1' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/colorsstore/cabinet/item/1369/58078133368_1.jpg?_ex=128x128', manufacturer_part_number = 'AXW022AA5E00' where name = '糸くずフィルター NA-FA9K2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/iiseikatsuzakka/cabinet/211876/70129961_img_0.jpg?_ex=128x128' where name = '糸くずフィルター NA-FD80H8' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden/axw22a9ma0.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-FW80S2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/idosawa/cabinet/kaden/axw22a9ma0.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-FW90S2' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/yaostore/cabinet/kaden/imgrc0097654263.jpg?_ex=128x128', manufacturer_part_number = 'AXW22A' where name = '糸くずフィルター NA-TF595' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/dcc/cabinet/toshiba/44071661.jpg?_ex=128x128', manufacturer_part_number = '44071661' where name = '製氷皿 GR-M15BS' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/biccamera/cabinet/product/10565/00000013015459_a01.jpg?_ex=128x128' where name = '製氷皿 MR-JX52W' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mary-b/cabinet/hitachi/2022/r-b6200-001.jpg?_ex=128x128' where name = '製氷皿 R-B6200' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/noimage-inu.jpg?_ex=128x128' where name = '製氷皿 R-B6700' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/thinkrich/cabinet/sale2_muryou_06/s06985.jpg?_ex=128x128' where name = '製氷皿 R-C6700' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/useful-company/cabinet/02083677/02083678/r-g6700d-016.jpg?_ex=128x128' where name = '製氷皿 R-G6700D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cocochi11/cabinet/hitachi/r-s4000h-321.jpg?_ex=128x128' where name = '製氷皿 R-S4000H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/partscomstore/cabinet/shohin01/hitachi/hi000501/r-s4200d-006.jpg?_ex=128x128' where name = '製氷皿 R-S4200D' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/cocochi11/cabinet/shohin-1/1/no-image.jpg?_ex=128x128' where name = '製氷皿 R-WX74J' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/denkiti/cabinet/hitachi/hitati_reiozuko/r-x6000059_00.jpg?_ex=128x128' where name = '製氷皿 R-X6000' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/mary-b/cabinet/hitachi/2021/r-x7300f-023.jpg?_ex=128x128' where name = '製氷皿 R-X7300F' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/upb-houseup/cabinet/hitachi/2021/r-xg5600h-321.jpg?_ex=128x128' where name = '製氷皿 R-XG5600H' and image_url is null;
update parts set image_url = 'https://thumbnail.image.rakuten.co.jp/@0_mall/peacedenki/cabinet/hitachi-nz/r-z6200-026.jpg?_ex=128x128' where name = '製氷皿 R-Z6200' and image_url is null;
-- Auto-generated by scripts/verify-appliances.ts
-- 2026-05-18T13:14:53.121Z
-- Re-classifies unverified -> verified when 楽天 search reveals part listings

update appliances set is_verified = true where model_number = 'AN22RASK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN22SABKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN25RASK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN25SABKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28RASK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28SABKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28WES-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28WESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28XES-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28XESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28YEBKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28ZEBKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28ZES-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN28ZESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36RASK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36REBKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36SABKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36SES-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36SESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36TEBKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36TES-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36TESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36UEBKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36UES-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36UESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36VEBKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36VESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36WEBKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36WES-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36WESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36XES-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36XESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36YEBKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36ZEBKS-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36ZES-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN36ZESK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40RAPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40REBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40RNP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40SABKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40SEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40SEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40TEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40TEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40TEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40UEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40UEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40UEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40VEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40VEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40WEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40WEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40WEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40XEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40XEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40YEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40ZEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40ZEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN40ZEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56RAPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56REBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56SABKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56SEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56SEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56TEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56TEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56TEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56UEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56UEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56UEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56VEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56VEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56WEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56WEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56WEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56XEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56XEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56YEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56ZEBKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56ZEP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN56ZEPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN63RAPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN63SABKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN71RAPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN71SABKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN80RAPK-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AN80SABKP-W' and manufacturer = 'ダイキン';
update appliances set is_verified = true where model_number = 'AW-10DP1' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-10DP2' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-10DP3' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-10SD9' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-10SV9' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-10VH1' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-10VP2' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-50GK' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-50GKC' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-50GL' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-50GLC' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-50GMC' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-60DM' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-60GK' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-70DK' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-70DKE8' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-7GM1' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AW-8D8' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'AX-CX2' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-GX2' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-HA20' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-HC1' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-HC2' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-HC3' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-HC4' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-HT2' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-M1' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-MX1' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-PX1' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-PX2' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-S1' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'AX-X2' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'BW-D702S' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-D70WV' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-D90TS' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-D9GV' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-D9HV' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-D9TV' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-DBK70B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-DV100B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-DV703S' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-DV8E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-DV90A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-DV90B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-E680KV' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-KSV100B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-KSV100E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-KSX100F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-T800' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-T803' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-T804' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-T805' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-T806' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-T807' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V100B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V100E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V70A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V70E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V70F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V80A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V80B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V80E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V80F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V80G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V90A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V90B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-V90E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-X100G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'BW-X90G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'CS-E225CZ' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-E255CZ' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-E285CZ' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX225C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX226C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX255C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX285C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX365C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX401D' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX405C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX565C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX635C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-EX715C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F225C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F225CZ' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F255C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F255CZ' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F258C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F285C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F285CZ' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F288CZ' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F365C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F405C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F408C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-F565C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-GX225C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-GX255C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-GX405C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-HX285C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-HX365C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-HX405C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-HX715C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-HX805C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-J225C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-J255C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-J258C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-J285C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-J365C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-J405C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-J565C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-J568C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-WX407C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-WX567C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-WX637C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-WX717C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-WX807C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-WX907C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-X220D' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-X225C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-X228C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-X250D' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-X400D' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-X400D2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-X408C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-X408C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-X630D2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS228C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS258C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS259C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS288C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS369C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS369C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS409C' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS409C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS569C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS639C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS809C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'CS-XS909C2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'EC-AH2R' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-AH5' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-AP500' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-AR2SX' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-AR3S' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-AR5X' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-AS500' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-AS510' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-AS700' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-FR5' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-KH7X' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-KH9X' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-KR3' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-PR10' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-PX700' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-SR3S' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-SR5' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-SR7' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-SR8' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'EC-SR9' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ER-F3' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-G3' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-H10' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-H3' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-J3' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-J3A' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-JD7' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-JD7A' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-JD8' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-JD8A' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-KD8' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-N6' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-ND300' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-ND500' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-ND8' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-PD5000' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-PD7000' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-PD8' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-RD5000' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-RD7' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-RD7000' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-SD100' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-SD5000' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-SD7000' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-TD70' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-V60' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-VD5000' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-VD7000' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-VD80' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-W60' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-WD7000' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-X60' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-XD80' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-YJ3' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ER-YJ3A' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'ES-A210' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-AG70D' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-AG80D' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-B75D' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-C60S' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-C75D' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-GV80' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-GV80P' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-GV8B' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-GX8' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-GX850' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-GX8A' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-K700' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-KG73' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-KG73V' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-N7K' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-P110' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-PT10C' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-PT10D' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-PT10F' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-T805' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-TX5A' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-TX5B' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-TX5C' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-TX5E' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-TX70' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-TX800' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-TX8D' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-TX900' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-TX910' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-U111' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-W111' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-W114' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-X11A' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-X11B' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'ES-ZP1' and manufacturer = 'シャープ';
update appliances set is_verified = true where model_number = 'GR-E50F' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-E50FX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-E55F' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-E55FX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-F43G' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-F43GL' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-F43N' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-F48FX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-F51FXV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-F56FXV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-G43G' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-G43GL' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-G43GXV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-G48FS' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-G48FX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-G51FX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-G51FXV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-G56FXV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-H43G' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-H43GL' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-H43GXV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-H43GXVE' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-H43GXVL' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-H460FV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-H510FV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-H560FV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-H610FV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-J43G' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-K460FW' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-K47FR' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-K50FR' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-K510FD' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-K510FWX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M41G' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M41GL' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M41GXV' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M460FW' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M460FWX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M47FP' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M47FX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M50FP' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M50FX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M510FD' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M510FW' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-M510FWX' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-P510FD' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-P550FW' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-P600FW' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-P600FWA' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-R470GW' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-R550FZ' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'GR-R600FZ' and manufacturer = '東芝';
update appliances set is_verified = true where model_number = 'JPB-R100W' and manufacturer = 'タイガー魔法瓶';
update appliances set is_verified = true where model_number = 'JPB1865' and manufacturer = 'タイガー魔法瓶';
update appliances set is_verified = true where model_number = 'JPC-B100K' and manufacturer = 'タイガー魔法瓶';
update appliances set is_verified = true where model_number = 'JPC-B100W' and manufacturer = 'タイガー魔法瓶';
update appliances set is_verified = true where model_number = 'MR-B46A' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-B46C' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-B46D' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-B46E' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-B46F' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-B46G' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-B46Z' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-BX53X' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-E52S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-E57S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-EX62S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX52C' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX53X' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX53Y' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX53Z' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX60A' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX60C' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX60W' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX61X' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX61Y' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX61Z' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-JX64W' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MB45E' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MB45F' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MB45G' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MB45H' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX46E' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX46F' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX46G' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX46H' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX50D' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX50E' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX50F' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX50G' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX50H' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX57D' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX57E' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX57F' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MX57G' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-MZ60H' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-P15Z' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-R46J' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-R47W' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-R52W' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-RX46A' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-RX46C' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-RX52T' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-RX57T' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX47H' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX48Z' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX52H' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX60A' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX60C' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX60D' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX60E' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX60G' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX61Y' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX61Z' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MR-WX70E' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MRO-NF6' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'MRO-NV2000' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'MRO-RF6' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'MRO-RS7' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'MRO-RS8' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'MRO-SF6' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'MSZ-AH225' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-BXV220' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-BXV250' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-BXV280' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-BXV360' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-BXV400S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-BXV560S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GR220' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GR250' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GR400S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GR560S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GW228' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GW258' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GW288' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GW289' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GW368' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GW408S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-GW508S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV251' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV2518' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV252' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV255' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV259' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV281S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV282S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV285S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV287S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV289S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV401S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV402S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV404S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV405S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV407S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV409S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV507S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV509S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV561S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV562S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV565S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV634S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-HXV635S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV220' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV221' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV2216' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV224' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV225' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV227' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV228' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV229' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV250' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV251' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV2516' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV254' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV255' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV257' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV258' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV259' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV280' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV280S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV281' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV2816' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV2816S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV281S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV284' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV284S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV285' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV285S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV288' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV288S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV289' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV289S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV360' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV360S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV361' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV361S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV364' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV364S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV368' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV368S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV369' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV369S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV400S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV401S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV404S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV408S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV409S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV508S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV509S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV560S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV561S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-JXV564S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-X2216' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-X225' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-X2516' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-X255' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-X2816' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-X285' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-X3616' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-X365' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-XD2219' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-XD2519' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-XD2818S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-XD3619S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-XD4019S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-XD5619S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-XD6319S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW220' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW221' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW227' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW228' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW250' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW257' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW258' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW280' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW288' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW360' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW367' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW368' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW400S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW407S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW408S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW507S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW508S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW560S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW630S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW637S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZW710S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV220' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV221' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV222' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV227' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV228' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV250' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV252' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV257' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV258' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV280' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV280S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV282' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV287' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV287S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV288' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV288S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV360' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV360S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV362' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV367' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV367S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV368' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV368S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV400S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV407S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV408S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV507S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV637S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'MSZ-ZXV638S' and manufacturer = '三菱電機';
update appliances set is_verified = true where model_number = 'NA-F50B13' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-F50BE8' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-F60PB12' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-F70PB8' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-F7AE3' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-F7AE4' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-F8AE7' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-F9AE4' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA100H3' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA100H5' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA100H7' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA10H3' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA110K5' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA120V5' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA12V1' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA70H1' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA7H1' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA80H1' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA80H3' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA80H5' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FA80H7' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FS60H7' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FW100K7' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FW120V1' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FW120V2' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FW80S1' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-FW80S6' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-LX129AL' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-SVX80AL' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-SVX80BL' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-SVX80BR' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-SVX880L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-SVX880R' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VG1200L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VG1300L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VG2200L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VG2300L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VG2400L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX3300L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX5E3' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX700AL' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX700AR' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX700BL' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX7600' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX7600L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX7900L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX800BL' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX800BR' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX8600' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX8600L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX8700L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX8800L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX8800R' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX8900L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX900AR' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX900BL' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX900BR' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX9300L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX9500' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX9500L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX9600' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX9600L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX9700L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX9800L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX9900L' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NA-VX9900R' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-BS1100' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-BS1200' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-BS1300' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-BS1400' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-BS803' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-BS901' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-BS902' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-BS903' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-BS904' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-JBS653' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NE-T152' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NR-E417EX' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NR-F454HPX' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NR-F472V' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NR-F504HPX' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NR-F552PV' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NR-F553HPX' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NR-F560PV' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NR-F602XPV' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'NR-F603HPX' and manufacturer = 'Panasonic';
update appliances set is_verified = true where model_number = 'PV-BH500G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'PV-BH900G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'PV-BH900J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'PV-BL30K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'PV-BL50K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'PV-BT5000' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-A5700' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-A6200' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-B5200' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-CW5200' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-F480E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-F520D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-G5700D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-HW54R' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-MW5700D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-S4000G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-S40R' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-S4200E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-S4200F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-S5000E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-W5700' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-WXC62N' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-WXC62S' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-X5700F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-X6200F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-XG56J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-XG6200H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'R-Z5700' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-A22C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-A22D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-A22E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-A25Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-A28C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-A28D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-A28E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-A28Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22AE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22BE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22BG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22CE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22CG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22DE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22DG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22EE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22EG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22FE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22FG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ22Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25AE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25BE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25BG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25CE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25CG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25DE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25DG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25EE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25EG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25FE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25FG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ25Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28AE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28BE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28BG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28CE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28CG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28DE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28DG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28EE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28EG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28FE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28FG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ28Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36AE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36BE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36BG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36CE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36CG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36EE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36EG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36FE' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36FG' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ36Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJ40F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJN22A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJN22D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJN25A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJN25D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJN28A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJN28D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJN36A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AJN36D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AN28C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AS22A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AS22B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AS22C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AS25A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AS25B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AS25C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AS28A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AS28B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AS28C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ASN22B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AT22B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AT25B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AT28B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AW22D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AW22E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AW25C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AW25D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AW25E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AW28C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AW28D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-AW28E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-BJ22D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-BJ25D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-BJ28D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-BJ36D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-D22D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-D22E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-D22F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-D25D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-D25E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-D25F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-D28D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-D28E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-D28F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-DT22C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-DT25C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-DT28C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F220Y' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F22C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F22D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F22E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F25D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F25E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F28C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F28D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F28E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F36D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-F36E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ22A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ22B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ22C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ22D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ22E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ22F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ22X' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ22Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ25A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ25B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ25C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ25D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ25E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ25X' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ25Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ28A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ28B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ28C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ28D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ28E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ28F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ28X' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ28Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ36A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ36B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ36C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ36D' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ36E' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ36F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ36X' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KJ36Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KS22K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KS25K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KS28K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-KS36K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-N22S' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-N22T' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-N25S' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-N25T' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-N28S' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-N28T' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-NF225' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-NJ22T' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-NJ25T' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-NJ28T' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-NJ28V' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-NJ36T' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-NJ36V' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-R22A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-R22B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-R22C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-R22Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-R28A' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-R28B' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-R28C' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-R28Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-RN22Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-RN28Z' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-S22K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-S25K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-S28K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-S36K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X22F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X22G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X22H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X22J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X22K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X22L' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X25F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X25G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X25H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X25J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X25K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X28F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X28G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X28H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X28J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X28K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X28L' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X36F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X36G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X36H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X36J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X36K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-X40K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC22F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC22G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC22H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC22J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC22K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC25F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC25G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC25H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC25J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC25K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC28F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC28G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC28H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC28J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC28K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC28L' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC36F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC36G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC36H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC36J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XC36K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XJ22G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XJ22K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XJ25G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XJ25K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XJ28F' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XJ28G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XJ28K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XJ36G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XJ36K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XK25G' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XK25H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XK25J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XK25K' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-XK25L' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ZJ22H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ZJ22J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ZJ22M' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ZJ25H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ZJ25J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ZJ28H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ZJ28J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ZJ36H' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'RAS-ZJ36J' and manufacturer = '日立';
update appliances set is_verified = true where model_number = 'V15 Detect' and manufacturer = 'ダイソン';

-- ============================================================
-- データに基づく追加 verify (部品が image/MPN を持つ機種)
-- ============================================================
update appliances set is_verified = true
where id in (
  select distinct ap.appliance_id
  from appliance_parts ap
  join parts p on p.id = ap.part_id
  where p.image_url is not null or p.manufacturer_part_number is not null
);
