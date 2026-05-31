-- ============================================================
-- 空気清浄機カテゴリ追加
-- appliance_category enum に air_purifier を追加。
-- 新しい enum 値は同一トランザクション内で使用できないため、
-- データ投入は次のマイグレーション (0007) で行う。
-- ============================================================

alter type appliance_category add value if not exists 'air_purifier';
