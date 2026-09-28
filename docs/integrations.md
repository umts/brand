# Integrations

Preconfigured styles and views for common libraries. Further configuration and options are heavily discouraged as this
library should be the source of truth for core styling.

## bootstrap

```scss
@use "pkg:@umts/brand/bootstrap";
```

- configures automatic light/dark mode switching
- adds `-neutral` variants for alerts and buttons (will look neutral in both light/dark mode)

## datatables.net

```scss
@use "pkg:@umts/brand/datatables.net";
```

- imports bootstrap 5 theme
- adds support for automatic light/dark mode switching
- removes extra padding under `.table-responsive`
- reverts right alignment for numeric/date types
- replaces sortable header outlines with hover colors

## fontawesome

```scss
// for apps that have switched to propshaft
@use "pkg:@umts/brand/fontawesome";

// for apps still using sprockets
@use "pkg:@umts/brand/fontawesome" with (
  $asset-path: "@fortawesome/fontawesome-free/webfonts"
);
```

- configures asset path for apps using propshaft
- configures brand/regular/solid icons
- re-exports scss variables/mixins (variants namespaced under `brand-`/`regular-`/`solid-`)

## fullcalendar

```scss
@use "pkg:@umts/brand/fullcalendar";
```

- imports bootstrap 5 theme (must still be selected at the js level)

## kaminari

Automatically detected and set up.

- configures default page/window sizes
- styles the default paginator with bootstrap 5 and fontawesome icons

## public-sans

```scss
@use "pkg:@umts/brand/public-sans";

// for apps still using sprockets
@use "pkg:@umts/brand/fontawesome" with (
  $asset-path: "@fontsource/public-sans/files
);
```

- configures asset path for apps using propshaft
- configures all available weights

## tom-select

```scss
@use "pkg:@umts/brand/tom-select";
```

- imports bootstrap 5 theme
- adds a small rule to prevent multi-selects from jumping around (assumes you are using a stimulus controller named
  `tom-select`).
