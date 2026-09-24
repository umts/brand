# Styles

Each stylesheet consists of common configurations and/or overrides for a corresponding library. These libraries are not
bundled and must be installed as peer dependencies for your app to compile.

## public-sans

```scss
@use "pkg:@umts/brand/public-sans";
```

Preconfigured with all available weights and with the propshaft compatible asset path provided by the engine.

### Options

```scss
$asset-path: "your-path"; /* path where font files are located (for apps still using sprockets) */
```
