export function formatJPY(value: number | null | undefined): string {
  if (value == null) return "—";
  return `¥${value.toLocaleString("ja-JP")}`;
}

export const APPLIANCE_CATEGORY_LABEL: Record<string, string> = {
  rice_cooker: "炊飯器",
  washing_machine: "洗濯機",
  vacuum: "掃除機",
  air_conditioner: "エアコン",
  microwave: "電子レンジ",
  refrigerator: "冷蔵庫",
  other: "その他",
};

export const PART_CATEGORY_LABEL: Record<string, string> = {
  inner_pot: "内釜",
  filter: "フィルター",
  remote: "リモコン",
  battery: "バッテリー",
  bag: "集塵パック",
  brush: "ブラシ",
  belt: "ベルト",
  gasket: "パッキン",
  turntable: "ターンテーブル",
  ice_tray: "製氷皿",
  other: "その他",
};
