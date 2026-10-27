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

## Tabbed

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
