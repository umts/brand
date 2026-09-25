# Views

The following partials are automatically made available by the engine under `umts/brand/*`.

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

## university_header

The branded UMass Amherst public page header, based off the official university branding guidelines.

```haml
= render partial: 'umts/brand/university_header',
         locals: { parent_department_name: 'Facilities & Campus Services',
                   parent_department_link: 'https://www.umass.edu/facilities',
                   department_name: 'Transportation Services',
                   department_link: 'https://www.umass.edu/transportation' }
```

> [!WARNING]
> Contains university trademarks (must opt in via initializer).

## university_footer

The branded UMass Amherst public page footer, based off the official university branding guidelines.

```haml
= render partial: 'umts/brand/university_footer'
```

> [!WARNING]
> Contains university trademarks (must opt in via initializer).
