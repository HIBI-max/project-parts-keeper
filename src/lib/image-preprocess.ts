/**
 * OCR 用の画像前処理（クライアント側、Canvas API）
 *
 * パイプライン:
 *   1. グレースケール変換 (R*0.299 + G*0.587 + B*0.114)
 *   2. コントラストストレッチ（ヒストグラムの両端 1% を捨てて 0-255 にスケール）
 *   3. Otsu の方法で自動閾値 → 二値化
 *   4. 背景が黒なら反転（Tesseract は白背景前提）
 *
 * 出力は同サイズの PNG Blob。Tesseract.js にそのまま渡せる。
 */

export interface PreprocessResult {
  blob: Blob;
  width: number;
  height: number;
}

export async function preprocessForOCR(file: File | Blob): Promise<PreprocessResult> {
  const img = await createImageBitmap(file);
  const canvas = new OffscreenCanvas(img.width, img.height);
  const ctx = canvas.getContext("2d");
  if (!ctx) throw new Error("Canvas 2D context unavailable");
  ctx.drawImage(img, 0, 0);

  const imageData = ctx.getImageData(0, 0, img.width, img.height);
  const data = imageData.data;
  const total = img.width * img.height;

  // 1. グレースケール変換 + ヒストグラム生成
  const histogram = new Uint32Array(256);
  for (let i = 0; i < data.length; i += 4) {
    const gray = Math.round(0.299 * data[i] + 0.587 * data[i + 1] + 0.114 * data[i + 2]);
    data[i] = gray;
    data[i + 1] = gray;
    data[i + 2] = gray;
    histogram[gray]++;
  }

  // 2. コントラストストレッチ（両端 1% カット）
  const cutoff = Math.floor(total * 0.01);
  let low = 0;
  let acc = 0;
  for (let i = 0; i < 256; i++) {
    acc += histogram[i];
    if (acc > cutoff) {
      low = i;
      break;
    }
  }
  let high = 255;
  acc = 0;
  for (let i = 255; i >= 0; i--) {
    acc += histogram[i];
    if (acc > cutoff) {
      high = i;
      break;
    }
  }
  const range = Math.max(1, high - low);
  for (let i = 0; i < data.length; i += 4) {
    const v = data[i];
    const stretched = Math.max(0, Math.min(255, Math.round(((v - low) * 255) / range)));
    data[i] = stretched;
    data[i + 1] = stretched;
    data[i + 2] = stretched;
  }

  // 3. Otsu の方法で閾値算出（ストレッチ後ヒストグラムから）
  const histStretched = new Uint32Array(256);
  for (let i = 0; i < data.length; i += 4) histStretched[data[i]]++;
  const threshold = otsuThreshold(histStretched, total);

  // 4. 二値化 + 背景反転判定
  let blackCount = 0;
  for (let i = 0; i < data.length; i += 4) {
    if (data[i] < threshold) blackCount++;
  }
  const shouldInvert = blackCount > total / 2; // 黒が多数 = 黒地白文字 → 反転

  for (let i = 0; i < data.length; i += 4) {
    let v = data[i] < threshold ? 0 : 255;
    if (shouldInvert) v = 255 - v;
    data[i] = v;
    data[i + 1] = v;
    data[i + 2] = v;
  }

  ctx.putImageData(imageData, 0, 0);
  const blob = await canvas.convertToBlob({ type: "image/png" });
  return { blob, width: img.width, height: img.height };
}

function otsuThreshold(histogram: Uint32Array, total: number): number {
  let sum = 0;
  for (let i = 0; i < 256; i++) sum += i * histogram[i];

  let sumB = 0;
  let wB = 0;
  let maxVariance = 0;
  let threshold = 127;

  for (let i = 0; i < 256; i++) {
    wB += histogram[i];
    if (wB === 0) continue;
    const wF = total - wB;
    if (wF === 0) break;
    sumB += i * histogram[i];
    const mB = sumB / wB;
    const mF = (sum - sumB) / wF;
    const variance = wB * wF * (mB - mF) ** 2;
    if (variance > maxVariance) {
      maxVariance = variance;
      threshold = i;
    }
  }
  return threshold;
}
