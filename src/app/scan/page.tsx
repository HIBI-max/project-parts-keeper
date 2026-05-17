"use client";

import Link from "next/link";
import { useState } from "react";
import { preprocessForOCR } from "@/lib/image-preprocess";

type Status = "idle" | "scanning" | "done" | "error";

// 家電型番らしいパターン: 大文字英 + 数字 + ハイフン
// 例: SR-MPA101, NW-JZ10, NA-FA8H1, EC-PX700, V12, MR-WX60G
const MODEL_PATTERN = /\b[A-Z]{1,4}-?[A-Z0-9]{2,}[0-9]+[A-Z0-9]*\b/g;

interface BarcodeDetectorLike {
  detect: (image: ImageBitmapSource) => Promise<Array<{ rawValue: string; format: string }>>;
}

interface BarcodeCtor {
  new (init?: { formats?: string[] }): BarcodeDetectorLike;
}

export default function ScanPage() {
  const [status, setStatus] = useState<Status>("idle");
  const [preview, setPreview] = useState<string | null>(null);
  const [processed, setProcessed] = useState<string | null>(null);
  const [candidates, setCandidates] = useState<string[]>([]);
  const [barcodes, setBarcodes] = useState<string[]>([]);
  const [rawText, setRawText] = useState<string>("");
  const [error, setError] = useState<string | null>(null);

  async function handleFile(file: File) {
    setError(null);
    setStatus("scanning");
    setCandidates([]);
    setBarcodes([]);
    setRawText("");
    setProcessed(null);
    setPreview(URL.createObjectURL(file));

    try {
      // 1) バーコード優先（軽量・即時、原画像で）
      const BarcodeDetector = (window as unknown as { BarcodeDetector?: BarcodeCtor })
        .BarcodeDetector;
      if (BarcodeDetector) {
        try {
          const bd = new BarcodeDetector();
          const bitmap = await createImageBitmap(file);
          const codes = await bd.detect(bitmap);
          if (codes.length > 0) {
            setBarcodes(codes.map((c) => c.rawValue));
          }
        } catch {
          // BarcodeDetector が拒否しても OCR にフォールバック
        }
      }

      // 2) 画像前処理（グレースケール + コントラストストレッチ + Otsu 二値化）
      let ocrInput: File | Blob = file;
      try {
        const pre = await preprocessForOCR(file);
        ocrInput = pre.blob;
        setProcessed(URL.createObjectURL(pre.blob));
      } catch {
        // 前処理失敗時は原画像にフォールバック
      }

      // 3) OCR (Tesseract.js, eng) — モデル番号は ASCII なので英語データで十分
      const Tesseract = await import("tesseract.js");
      const { data } = await Tesseract.recognize(ocrInput, "eng");
      const text = data.text ?? "";
      setRawText(text);

      const matches = text.toUpperCase().match(MODEL_PATTERN) ?? [];
      // ノイズ除去: 4 文字以上 / 数字を 1 つは含む
      const cleaned = [...new Set(matches)].filter(
        (m) => m.length >= 4 && /[0-9]/.test(m),
      );
      setCandidates(cleaned);

      setStatus("done");
    } catch (e) {
      setError(e instanceof Error ? e.message : "認識に失敗しました");
      setStatus("error");
    }
  }

  return (
    <div className="mx-auto max-w-3xl px-4 py-6">
      <Link href="/" className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]">
        ← トップへ
      </Link>

      <h1 className="mt-3 text-xl font-bold">型番をカメラで読み取る</h1>
      <p className="mt-1 text-sm text-[var(--muted)]">
        家電本体の背面・底面ラベルを撮影してください。
      </p>

      <label className="mt-5 block">
        <span className="block w-full text-center px-5 py-3 rounded-lg bg-[var(--accent)] text-white font-medium hover:bg-[var(--accent-deep)] cursor-pointer">
          {status === "scanning" ? "読み取り中…" : "📷 カメラを起動 / 画像を選択"}
        </span>
        <input
          type="file"
          accept="image/*"
          capture="environment"
          onChange={(e) => {
            const file = e.target.files?.[0];
            if (file) handleFile(file);
          }}
          className="hidden"
          disabled={status === "scanning"}
        />
      </label>

      {preview && (
        <div className="mt-5 grid grid-cols-2 gap-2">
          <div>
            <div className="text-xs text-[var(--muted)] mb-1">撮影画像</div>
            {/* biome-ignore lint/a11y/useAltText: ユーザー撮影のラベル画像のため装飾扱い */}
            <img
              src={preview}
              alt=""
              className="w-full max-h-48 object-contain rounded border border-[var(--card-border)] bg-[var(--card)]"
            />
          </div>
          {processed && (
            <div>
              <div className="text-xs text-[var(--muted)] mb-1">OCR 入力</div>
              {/* biome-ignore lint/a11y/useAltText: 前処理後の二値化画像 */}
              <img
                src={processed}
                alt=""
                className="w-full max-h-48 object-contain rounded border border-[var(--card-border)] bg-white"
              />
            </div>
          )}
        </div>
      )}

      {error && (
        <div className="mt-4 rounded-lg bg-red-50 border border-red-200 px-4 py-3 text-sm text-red-800">
          {error}
        </div>
      )}

      {status === "scanning" && (
        <p className="mt-4 text-sm text-[var(--muted)]">
          初回は OCR エンジン (約 2MB) を読み込むため数秒かかります…
        </p>
      )}

      {status === "done" && barcodes.length > 0 && (
        <section className="mt-6">
          <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-2">
            バーコード
          </h2>
          <ul className="space-y-2">
            {barcodes.map((b) => (
              <li key={b}>
                <Link
                  href={`/search?q=${encodeURIComponent(b)}`}
                  className="block bg-[var(--card)] border border-[var(--card-border)] rounded-lg px-4 py-3 font-mono text-sm hover:border-[var(--accent)]"
                >
                  {b}
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      {status === "done" && candidates.length > 0 && (
        <section className="mt-6">
          <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-2">
            型番候補
          </h2>
          <ul className="space-y-2">
            {candidates.map((c) => (
              <li key={c}>
                <Link
                  href={`/search?q=${encodeURIComponent(c)}`}
                  className="flex items-center justify-between bg-[var(--card)] border border-[var(--card-border)] rounded-lg px-4 py-3 hover:border-[var(--accent)]"
                >
                  <span className="font-mono font-semibold">{c}</span>
                  <span className="text-xs text-[var(--accent-deep)]">この型番で検索 →</span>
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      {status === "done" && candidates.length === 0 && barcodes.length === 0 && (
        <div className="mt-6 text-center py-6 text-sm text-[var(--muted)]">
          型番らしきテキストが見つかりませんでした。
          <br />
          <Link href="/search" className="text-[var(--accent-deep)] underline">
            手動で検索する
          </Link>
          {rawText && (
            <details className="mt-4 text-left">
              <summary className="cursor-pointer text-xs">読み取ったテキスト全体を見る</summary>
              <pre className="mt-2 p-2 bg-[var(--card)] border border-[var(--card-border)] rounded text-xs whitespace-pre-wrap break-all">
                {rawText}
              </pre>
            </details>
          )}
        </div>
      )}
    </div>
  );
}
