import { defineConfig } from "vitepress";

export default defineConfig({
  base: "./",
  title: "umts-brand",
  description: "Preconfigured styles and views for UMTS rails apps.",
  themeConfig: {
    search: { provider: "local" },
    nav: [],
    sidebar: [
      {
        text: "Setup",
        items: [{ text: "Installation", link: "/installation" }],
      },
      {
        text: "Reference",
        items: [
          { text: "Integrations", link: "/integrations" },
          { text: "Layouts", link: "/layouts" },
          { text: "Utilities", link: "/utilities" },
        ],
      },
    ],
    socialLinks: [{ icon: "github", link: "https://github.com/umts/brand" }],
  },
});
