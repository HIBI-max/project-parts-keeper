import { ImageResponse } from "next/og";

export const size = { width: 180, height: 180 };
export const contentType = "image/png";

export default function AppleIcon() {
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
      }}
    >
      <div
        style={{
          fontSize: 92,
          fontWeight: 800,
          letterSpacing: -6,
          lineHeight: 1,
        }}
      >
        PK
      </div>
      <div
        style={{
          marginTop: 10,
          fontSize: 18,
          fontWeight: 600,
          letterSpacing: 1,
          opacity: 0.85,
        }}
      >
        PARTS KEEPER
      </div>
    </div>,
    size,
  );
}
