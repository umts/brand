# Utilities

General purpose styles/helpers/views for design consistency.

## Flash

Convenience methods are provided to controller actions to set generic flash messages for models.

```ruby
flash_success_for(my_model)
flash_success_now_for(my_model)
flash_errors_for(my_model)
flash_errors_now_for(my_model)
```

### Success

The success helpers will construct a flash message based on a subject and action type: "Successfully {actioned}
{subject}".

#### Actions

The method will automatically use the current method name to translate the action verb. This can be overridden by
passing the optional second argument (`flash_success_for(my_model, :my_action_override)`).

It will look for an action verb in the following locations:

- `.{action}.performed` (allows for per-controller action overrides)
- `performed.{action}' (allows for global overrides)

Finally, if the action is built-in (`create`, `update` and `destroy`) it will provide a default.

#### Subjects

If you pass an `ActiveModel::Model`, it will automatically call `model_name.human` (supports both instances and
classes).

Otherwise, it will interpolate whatever the subject is directly.

### Errors

The error helpers will construct a flash message from any validation error _currently_ present on the passed subject.

## Resource layout

Our default page layout, which includes a heading and space for bootstrap nav items. Uses a collector pattern
to cleanly collect subsections.

```haml
-# Without nav items
= render layout: 'umts/brand/resource', locals: { heading: 'Page title' } do |resource|
  - resource.heading 'Page title'
  - resource.body do
    Page content

-# With nav items
= render layout: 'umts/brand/resource', locals: { nav_expand: 'sm' } do |resource|
  - resource.heading 'Navigable page title'
  - resource.nav_items do
    = link_to 'Nav link', '#', class: 'nav-link'
  - resource.body do
    Navigable page content
```

## Card layout

Our card layout, which includes a heading and space for bootstrap nav items. Uses a collector pattern
to cleanly collect subsections.

Unlike the resource layout, the nav does not support collapse. If you need responsiveness you should manually
hide/show your nav items (maintain a flat version and a dropdown version).

```haml
-# Without nav items
= render layout: 'umts/brand/card' do |card|
  - card.heading 'Card title'
  - card.body do
    Card content

-# With nav items
= render layout: 'umts/brand/card' do |card|
  - card.heading 'Navigable card title'
  - card.nav_items do
    = link_to 'Nav link', '#', class: 'nav-link'
  - card.body do
    Navigable card content
```
