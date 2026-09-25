# Styles

Each stylesheet consists of common configurations and/or overrides for a corresponding library. These libraries are not
bundled and must be installed as peer dependencies for your app to compile.

## bootstrap

```scss
@use "pkg:@umts/brand/bootstrap";
```

Preconfigured with dark mode and UMass brand colors.

`-neutral` variants for alerts and buttons have been added that look neutral with both color modes.

### Options

Passed variables will be forwarded to the bootstrap stylesheet, although this is not recommended (this library
should be the source of truth for bootstrap customizations).

## fontawesome

```scss
@use "pkg:@umts/brand/fontawesome";
```

Preconfigured with brand/regular/solid icons and with the propshaft compatible asset path provided by the engine.

Re-exports scss variables/mixins. Variants are namespaced under `brand-`/`regular-`/`solid-`.

### Options

```scss
$asset-path: "your-path"; /* path where font files are located (for apps still using sprockets) */
```

## public-sans

```scss
@use "pkg:@umts/brand/public-sans";
```

Preconfigured with all available weights and with the propshaft compatible asset path provided by the engine.

### Options

```scss
$asset-path: "your-path"; /* path where font files are located (for apps still using sprockets) */
```

## public-sans

```scss
@use "pkg:@umts/brand/tom-select";
```

Preconfigured with the bootstrap 5 theme. Assuming you are using a stimulus controller named `tom-select`, also
includes small rule to prevent multi-selects from jumping around on page load.
