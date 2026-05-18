import { ImageResponse } from "next/og";

export const size = { width: 64, height: 64 };
export const contentType = "image/png";

export default function Icon() {
  return new ImageResponse(
    <div
      style={{
        background: "#2e6b69",
        width: "100%",
        height: "100%",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        color: "white",
        fontSize: 36,
        fontWeight: 800,
        letterSpacing: -2,
        fontFamily: "sans-serif",
      }}
    >
      PK
    </div>,
    size,
  );
}
