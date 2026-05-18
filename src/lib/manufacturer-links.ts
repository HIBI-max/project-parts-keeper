/**
 * 各メーカー公式の部品検索ページへのリンクを構築する。
 * URL パターンが分かるメーカーは型番を埋め込む、そうでなければトップへ。
 */

interface ManufacturerInfo {
  name: string;
  partsSearchUrl: (model: string) => string;
  note?: string;
}

const MANUFACTURERS: Record<string, ManufacturerInfo> = {
  Panasonic: {
    name: "Panasonic 部品検索",
    partsSearchUrl: (model) =>
      `https://askpc.panasonic.co.jp/parts_pri/?searchKey=${encodeURIComponent(model)}`,
  },
  象印: {
    name: "象印 修理・部品検索",
    partsSearchUrl: () => "https://www.zojirushi.co.jp/syohin/aftermarket/",
    note: "型番で検索可",
  },
  タイガー魔法瓶: {
    name: "タイガー 部品検索",
    partsSearchUrl: () => "https://www.tiger-corporation.com/jp/parts/",
    note: "型番で検索可",
  },
  東芝: {
    name: "東芝 部品・取扱説明書",
    partsSearchUrl: (model) =>
      `https://www.toshiba.co.jp/regza/support/parts/index_j.htm?model=${encodeURIComponent(model)}`,
  },
  三菱電機: {
    name: "三菱電機 部品検索",
    partsSearchUrl: () => "https://www.mitsubishielectric.co.jp/home/support/parts/",
  },
  日立: {
    name: "日立 部品検索",
    partsSearchUrl: (model) =>
      `https://kadenfan.hitachi.co.jp/parts/?searchKey=${encodeURIComponent(model)}`,
  },
  シャープ: {
    name: "シャープ 修理・部品",
    partsSearchUrl: () => "https://jp.sharp/support/repair/",
  },
  ダイキン: {
    name: "ダイキン 部品検索",
    partsSearchUrl: () => "https://www.daikincc.com/catalog/showRoom?menuId=2",
  },
  ダイソン: {
    name: "Dyson 公式パーツ",
    partsSearchUrl: (model) =>
      `https://www.dyson.co.jp/support/find-spares?keyword=${encodeURIComponent(model)}`,
  },
  マキタ: {
    name: "マキタ 部品検索",
    partsSearchUrl: () => "https://www.makita.co.jp/product/parts/",
  },
};

export function getManufacturerLink(
  manufacturer: string,
  model: string,
): { url: string; label: string; note?: string } | null {
  const info = MANUFACTURERS[manufacturer];
  if (!info) return null;
  return {
    url: info.partsSearchUrl(model),
    label: info.name,
    note: info.note,
  };
}
