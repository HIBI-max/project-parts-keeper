import type { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: "*",
        allow: "/",
        disallow: ["/api/", "/auth/", "/my"],
      },
    ],
    sitemap: "https://project-parts-keeper.vercel.app/sitemap.xml",
  };
}
