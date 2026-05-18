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
