import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ShareButtons } from "@/components/ShareButtons";
import { BLOG_POSTS, getBlogPost } from "@/lib/blog";
import { createClient } from "@/lib/supabase/server";

export function generateStaticParams() {
  return BLOG_POSTS.map((p) => ({ slug: p.slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const post = getBlogPost(slug);
  if (!post) return { title: "見つかりませんでした — Parts Keeper" };
  return {
    title: `${post.title} — Parts Keeper`,
    description: post.description,
    openGraph: { title: post.title, description: post.description, type: "article" },
    twitter: { title: post.title, description: post.description, card: "summary_large_image" },
  };
}

interface LinkedItem {
  type: "appliance" | "part";
  id: string;
  label: string;
  href: string;
}

async function resolveBlogLinks(
  content: string,
): Promise<{ content: string; linked: LinkedItem[] }> {
  const supabase = await createClient();
  const linked: LinkedItem[] = [];

  // [appliance:MODEL_NUMBER] or [appliance:MODEL_NUMBER|表示テキスト]
  const applianceMatches = [...content.matchAll(/\[appliance:([^\]|]+?)(?:\|([^\]]+))?\]/g)];
  const modelNumbers = [...new Set(applianceMatches.map((m) => m[1].trim()))];
  const appMap = new Map<string, { id: string; name: string }>();
  if (modelNumbers.length > 0) {
    const { data } = await supabase
      .from("appliances")
      .select("id, manufacturer, model_number, model_name")
      .in("model_number", modelNumbers);
    for (const r of data ?? []) {
      appMap.set(r.model_number, {
        id: r.id,
        name: `${r.manufacturer} ${r.model_number}`,
      });
    }
  }

  // [part:MPN] or [part:MPN|表示テキスト]
  const partMatches = [...content.matchAll(/\[part:([^\]|]+?)(?:\|([^\]]+))?\]/g)];
  const mpns = [...new Set(partMatches.map((m) => m[1].trim()))];
  const partMap = new Map<string, { id: string; name: string }>();
  if (mpns.length > 0) {
    const { data } = await supabase
      .from("parts")
      .select("id, name, manufacturer_part_number")
      .in("manufacturer_part_number", mpns);
    for (const r of data ?? []) {
      if (r.manufacturer_part_number)
        partMap.set(r.manufacturer_part_number, { id: r.id, name: r.name });
    }
  }

  // 置換
  let replaced = content;
  replaced = replaced.replace(/\[appliance:([^\]|]+?)(?:\|([^\]]+))?\]/g, (_, key, label) => {
    const k = key.trim();
    const info = appMap.get(k);
    if (!info) return label || k;
    const text = (label || k).trim();
    if (!linked.find((l) => l.id === info.id))
      linked.push({
        type: "appliance",
        id: info.id,
        label: info.name,
        href: `/appliance/${info.id}`,
      });
    return `<a href="/appliance/${info.id}" class="text-[var(--accent-deep)] underline underline-offset-2 hover:text-[var(--accent)]">${text}</a>`;
  });
  replaced = replaced.replace(/\[part:([^\]|]+?)(?:\|([^\]]+))?\]/g, (_, key, label) => {
    const k = key.trim();
    const info = partMap.get(k);
    if (!info) return label || k;
    const text = (label || k).trim();
    if (!linked.find((l) => l.id === info.id))
      linked.push({ type: "part", id: info.id, label: info.name, href: `/part/${info.id}` });
    return `<a href="/part/${info.id}" class="text-[var(--accent-deep)] underline underline-offset-2 hover:text-[var(--accent)]">${text}</a>`;
  });

  return { content: replaced, linked };
}

export default async function BlogPostPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const post = getBlogPost(slug);
  if (!post) notFound();

  const { content: resolvedContent, linked } = await resolveBlogLinks(post.content);

  const html = resolvedContent
    .split(/\n\n+/)
    .map((block) => {
      const t = block.trim();
      if (t.startsWith("## ")) return `<h2>${t.slice(3)}</h2>`;
      if (t.startsWith("# ")) return `<h1>${t.slice(2)}</h1>`;
      if (t.match(/^\|/m)) {
        // 簡易テーブル
        const rows = t.split("\n");
        const cells = rows
          .filter((r) => !r.match(/^\|[\s\-:]+\|/))
          .map((r) => r.split("|").slice(1, -1).map((c) => c.trim()));
        if (cells.length === 0) return "";
        const head = `<thead><tr>${cells[0].map((c) => `<th>${formatInline(c)}</th>`).join("")}</tr></thead>`;
        const body = cells
          .slice(1)
          .map((row) => `<tr>${row.map((c) => `<td>${formatInline(c)}</td>`).join("")}</tr>`)
          .join("");
        return `<table class="w-full border-collapse my-4"><tbody>${head}${body}</tbody></table>`;
      }
      if (t.startsWith("- ")) {
        const items = t
          .split("\n")
          .map((l) => l.replace(/^- /, "").trim())
          .filter(Boolean);
        return `<ul>${items.map((i) => `<li>${formatInline(i)}</li>`).join("")}</ul>`;
      }
      if (t.match(/^\d+\. /)) {
        const items = t
          .split("\n")
          .map((l) => l.replace(/^\d+\. /, "").trim())
          .filter(Boolean);
        return `<ol>${items.map((i) => `<li>${formatInline(i)}</li>`).join("")}</ol>`;
      }
      return `<p>${formatInline(t)}</p>`;
    })
    .join("\n");

  return (
    <article className="mx-auto max-w-3xl px-4 py-6">
      <Link href="/blog" className="text-xs text-[var(--muted)] hover:text-[var(--accent-deep)]">
        ← ブログ一覧
      </Link>

      <header className="mt-3">
        <div className="text-xs text-[var(--muted)]">{post.publishedAt}</div>
        <h1 className="mt-2 text-2xl sm:text-3xl font-bold leading-tight">{post.title}</h1>
        <p className="mt-3 text-sm text-[var(--muted)] leading-relaxed">{post.description}</p>
      </header>

      <div
        className="prose-blog mt-8 text-[15px] leading-relaxed [&_h2]:text-lg [&_h2]:font-bold [&_h2]:mt-8 [&_h2]:mb-3 [&_p]:my-3 [&_ul]:my-3 [&_ul]:pl-5 [&_ul]:list-disc [&_ol]:my-3 [&_ol]:pl-5 [&_ol]:list-decimal [&_li]:my-1 [&_table]:my-4 [&_th]:bg-[var(--card)] [&_th]:p-2 [&_th]:text-left [&_th]:border [&_th]:border-[var(--card-border)] [&_td]:p-2 [&_td]:border [&_td]:border-[var(--card-border)] [&_strong]:font-semibold"
        // biome-ignore lint/security/noDangerouslySetInnerHtml: trusted local content
        dangerouslySetInnerHTML={{ __html: html }}
      />

      {linked.length > 0 && (
        <section className="mt-10 rounded-xl border border-[var(--card-border)] bg-[var(--card)] p-5">
          <h2 className="text-sm font-semibold text-[var(--muted)] uppercase tracking-wider mb-3">
            この記事で紹介した機種・部品
          </h2>
          <ul className="space-y-2">
            {linked.map((item) => (
              <li key={item.id}>
                <Link
                  href={item.href}
                  className="flex items-center justify-between gap-2 rounded-lg border border-[var(--card-border)] bg-white px-3 py-2 hover:border-[var(--accent)]"
                >
                  <span className="text-sm font-medium truncate">{item.label}</span>
                  <span className="text-xs text-[var(--muted)] shrink-0">
                    {item.type === "appliance" ? "機種詳細 →" : "部品詳細 →"}
                  </span>
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      <ShareButtons
        url={`https://project-parts-keeper.vercel.app/blog/${post.slug}`}
        text={`${post.title} - Parts Keeper`}
      />

      <section className="mt-10 bg-[var(--card)] border border-[var(--card-border)] rounded-xl p-5 text-center">
        <p className="text-sm">あなたの家電の型番から、必要な交換部品をすぐ検索できます。</p>
        <Link
          href="/"
          className="mt-3 inline-block px-5 py-2.5 rounded-lg bg-[var(--accent)] text-white font-medium hover:bg-[var(--accent-deep)]"
        >
          型番から部品を探す →
        </Link>
      </section>
    </article>
  );
}

function formatInline(s: string): string {
  return s
    .replace(/\*\*([^*]+)\*\*/g, "<strong>$1</strong>")
    .replace(/`([^`]+)`/g, '<code class="px-1 bg-[var(--card)] border border-[var(--card-border)] rounded text-xs">$1</code>');
}
