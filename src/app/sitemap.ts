import type { MetadataRoute } from "next";
import { createClient } from "@/lib/supabase/server";

const BASE_URL = "https://project-parts-keeper.vercel.app";

export const revalidate = 3600; // 1h キャッシュ

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const supabase = await createClient();

  const { data: appliances } = await supabase
    .from("appliances")
    .select("slug, is_verified, created_at")
    .eq("is_verified", true)
    .order("created_at", { ascending: false })
    .limit(5000);

  const { data: parts } = await supabase
    .from("parts")
    .select("slug, image_url, manufacturer_part_number, created_at")
    .or("image_url.not.is.null,manufacturer_part_number.not.is.null")
    .order("created_at", { ascending: false })
    .limit(5000);

  const staticUrls: MetadataRoute.Sitemap = [
    { url: BASE_URL, lastModified: new Date(), priority: 1.0, changeFrequency: "weekly" },
    { url: `${BASE_URL}/search`, priority: 0.8, changeFrequency: "weekly" },
    { url: `${BASE_URL}/scan`, priority: 0.6, changeFrequency: "monthly" },
    { url: `${BASE_URL}/login`, priority: 0.3, changeFrequency: "yearly" },
    { url: `${BASE_URL}/privacy`, priority: 0.3, changeFrequency: "yearly" },
    { url: `${BASE_URL}/terms`, priority: 0.3, changeFrequency: "yearly" },
    { url: `${BASE_URL}/commerce`, priority: 0.3, changeFrequency: "yearly" },
    { url: `${BASE_URL}/contact`, priority: 0.3, changeFrequency: "yearly" },
  ];

  const applianceUrls: MetadataRoute.Sitemap = (appliances ?? []).map((a) => ({
    url: `${BASE_URL}/appliance/${a.slug}`,
    lastModified: new Date(a.created_at),
    priority: 0.7,
    changeFrequency: "monthly" as const,
  }));

  const partUrls: MetadataRoute.Sitemap = (parts ?? []).map((p) => ({
    url: `${BASE_URL}/part/${p.slug}`,
    lastModified: new Date(p.created_at),
    priority: 0.6,
    changeFrequency: "monthly" as const,
  }));

  return [...staticUrls, ...applianceUrls, ...partUrls];
}
