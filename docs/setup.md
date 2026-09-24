# Setup

This library is split into a gem and npm package.

```bash
bundle add umts-brand
npm install @umts/brand
```

You must be using `cssbundling-rails` with a modern sass compiler that supports the node package importer.

Recommended sass configuration:

```json
{
  "scripts": {
    "build:css": "sass app/assets/stylesheets/application.scss:app/assets/builds/application.css --load-path=node_modules --pkg-importer=node --quiet-deps --silence-deprecation=import"
  }
}
```
