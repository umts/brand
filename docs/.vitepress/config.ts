import { defineConfig } from "vitepress";

export default defineConfig({
  base: "./",
  title: "UMTS Brand",
  description: "Branding for rails apps",
  themeConfig: {
    nav: [],
    sidebar: [
      {
        items: [
          { text: "Setup", link: "/setup" },
          { text: "Styles", link: "/styles" },
          { text: "Views", link: "/views" },
        ],
      },
    ],
    socialLinks: [{ icon: "github", link: "https://github.com/umts/brand" }],
  },
});
