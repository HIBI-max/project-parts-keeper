import { withSentryConfig } from "@sentry/nextjs";
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  reactStrictMode: true,
  images: {
    remotePatterns: [
      { protocol: "https", hostname: "thumbnail.image.rakuten.co.jp" },
      { protocol: "https", hostname: "shop.r10s.jp" },
      { protocol: "https", hostname: "image.rakuten.co.jp" },
    ],
  },
};

// Sentry の設定は DSN が無ければ素通し
export default process.env.NEXT_PUBLIC_SENTRY_DSN
  ? withSentryConfig(nextConfig, {
      silent: true,
      org: process.env.SENTRY_ORG,
      project: process.env.SENTRY_PROJECT,
      tunnelRoute: "/monitoring",
      disableLogger: true,
    })
  : nextConfig;
