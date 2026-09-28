# Installation

This library is split into the `umts-brand` gem and `@umts/brand` npm package.

---

The gem defines a Rails Engine, which will automatically load and configure assets and views.

```ruby
# Gemfile

gem 'umts-brand'

```

---

The npm package exports raw `scss` files for your application to compile using `cssbundling-rails` and `sass`.

These stylesheets are exposed to/should be imported using `sass`' node package importer.
Some integrations will also require `node_modules/` to be the sass load path.

```json
// package.json

{
  "scripts": {
    "build:css": "sass app/assets/stylesheets/application.scss:app/assets/builds/application.css --load-path=node_modules --pkg-importer=node --quiet-deps --silence-deprecation=import"
  },
  "dependencies": {
    "@umts/brand": "*"
  }
}
```

---

Core branding consists of the `public-sans` and `bootstrap` stylesheets.

```scss
// app/assets/application.scss

@use "pkg:@umts/brand/bootstrap";
@use "pkg:@umts/brand/public-sans";
```
