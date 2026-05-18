import * as Sentry from "@sentry/nextjs";

const DSN = process.env.NEXT_PUBLIC_SENTRY_DSN;

if (DSN) {
  Sentry.init({
    dsn: DSN,
    tracesSampleRate: 0.1, // 10% のリクエストでパフォーマンス計測
    replaysOnErrorSampleRate: 1.0,
    replaysSessionSampleRate: 0.0, // セッション replay は無効（プライバシー優先）
    environment: process.env.NODE_ENV,
  });
}
