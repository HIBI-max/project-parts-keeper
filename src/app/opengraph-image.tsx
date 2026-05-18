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
      <div
        style={{
          background: "#f7f5f0",
          color: "#2e6b69",
          padding: "20px 30px",
          borderRadius: 20,
          fontSize: 120,
          fontWeight: 900,
          letterSpacing: -8,
          lineHeight: 1,
          marginBottom: 40,
        }}
      >
        PK
      </div>
      <div
        style={{
          fontSize: 64,
          fontWeight: 800,
          textAlign: "center",
          lineHeight: 1.2,
          marginBottom: 24,
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
          marginTop: 40,
          fontSize: 24,
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
