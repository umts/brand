# Utilities

General purpose styles/views for design consistency.

## tabbed

Our default page layout, which includes a heading and space for bootstrap nav items.

```haml
-# Without nav items
= render layout: 'umts/brand/tabbed', locals: { heading: 'Page title' } do
  Page content

-# With nav items
- nav_items = capture do
  %li.nav-item= link_to 'Nav link', '#', class: 'nav-link'
= render layout: 'umts/brand/tabbed', locals: { heading: 'Navigable page title', nav_items:, nav_expand: 'sm' } do
  Navigable page content
```
