-- ============================================================
-- V2 カテゴリ追加：冷蔵庫 + 部品カテゴリ拡張
-- 既存 appliance_category enum に refrigerator を追加
-- 既存 part_category enum に turntable / ice_tray を追加
-- ============================================================

alter type appliance_category add value 'refrigerator';
alter type part_category add value 'turntable';
alter type part_category add value 'ice_tray';
