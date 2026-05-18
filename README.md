# Parts Keeper

家電の型番から純正・互換部品を一発特定して、各 EC モールの在庫・価格を横断検索できる PWA。

## MVP スコープ

- 対応カテゴリ: **炊飯器・洗濯機・掃除機** の 3 カテゴリ
- 純正品のみ（互換品は V2）
- 型番テキスト入力（カメラ OCR は V1.5）
- 楽天市場 API 1 本（Amazon PA-API は売上実績後）

## セットアップ

```bash
pnpm install
pnpm db:start          # supabase ローカル起動 (54341-)
# → 出力された ANON_KEY を .env.local の NEXT_PUBLIC_SUPABASE_ANON_KEY に貼る
pnpm db:reset          # スキーマ + seed 投入
pnpm db:types          # supabase 型生成 → src/types/database.ts
pnpm dev               # http://localhost:3003
```

## 楽天 API キー

`https://webservice.rakuten.co.jp/` でアプリ登録 → `RAKUTEN_APP_ID` と
`RAKUTEN_AFFILIATE_ID` を `.env.local` に設定。未設定でも検索画面は動くが、部品詳細の
リアル価格は出ない。

## ポート割り当て

| 用途 | ポート |
|---|---|
| Next.js dev | 3003 |
| Supabase API | 54341 |
| Supabase DB | 54342 |
| Supabase Studio | 54343 |
| Supabase Inbucket | 54344 |
| Supabase Analytics | 54347 |

並行稼働している他プロジェクト: Shiori (3001/54331-), Scent Match (3002)。
"" 
