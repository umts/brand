# Setup

This library is split into a gem and npm package.

```bash
bundle add umts-brand
npm install @umts/brand
```

You must be using `cssbundling-rails` with a modern sass compiler that supports the node package importer.

```json
{
  "scripts": {
    "build:css": "sass app/assets/stylesheets/application.scss:app/assets/builds/application.css --load-path=node_modules --pkg-importer=node --quiet-deps --silence-deprecation=import"
  }
}
```

At the very minimum, you will want to use the `public-sans` and `bootstrap` stylesheets.

```scss
@use "pkg:@umts/brand/bootstrap";
@use "pkg:@umts/brand/public-sans";
```

> [!CAUTION]
> Some views and assets contain trademarks of the university. Usage of these trademarks is permitted only for
> internal, non-commercial use. See the license for more information.
>
> To guard against misuse, you must explicitly opt in to make these views available for use:
>
> ```ruby
> # config/initializers/brand.rb
>
> UMTS::Brand.use_university_trademarks!
> ```
