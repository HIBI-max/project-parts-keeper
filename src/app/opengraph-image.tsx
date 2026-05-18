import { ImageResponse } from "next/og";

export const alt = "Parts Keeper — 家電の部品を一発で見つける";
export const size = { width: 1200, height: 630 };
export const contentType = "image/png";

export default function OpengraphImage() {
  return new ImageResponse(
    <div
      style={{
        background: "#2e6b69",
        width: "100%",
        height: "100%",
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "center",
        color: "white",
        fontFamily: "sans-serif",
        padding: 80,
      }}
    >
      {/* 大きな循環矢印アイコン */}
      <div
        style={{
          background: "rgba(255,255,255,0.12)",
          borderRadius: 200,
          padding: 30,
          display: "flex",
          marginBottom: 40,
        }}
      >
        <svg width="180" height="180" viewBox="0 0 24 24" fill="white">
          <title>Parts Keeper</title>
          <path d="M17.65 6.35C16.2 4.9 14.21 4 12 4c-4.42 0-7.99 3.58-7.99 8s3.57 8 7.99 8c3.73 0 6.84-2.55 7.73-6h-2.08c-.82 2.33-3.04 4-5.65 4-3.31 0-6-2.69-6-6s2.69-6 6-6c1.66 0 3.14.69 4.22 1.78L13 11h7V4l-2.35 2.35z" />
        </svg>
      </div>
      <div
        style={{
          fontSize: 72,
          fontWeight: 900,
          letterSpacing: -2,
          marginBottom: 20,
        }}
      >
        Parts Keeper
      </div>
      <div
        style={{
          fontSize: 36,
          fontWeight: 500,
          opacity: 0.92,
          textAlign: "center",
          lineHeight: 1.3,
        }}
      >
        まだ動く家電を、部品で延命する。
      </div>
      <div
        style={{
          marginTop: 32,
          fontSize: 22,
          opacity: 0.7,
          letterSpacing: 2,
        }}
      >
        炊飯器 · 洗濯機 · 掃除機 · エアコン · 電子レンジ · 冷蔵庫
      </div>
    </div>,
    size,
  );
}
