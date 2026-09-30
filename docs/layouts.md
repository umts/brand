# Layouts

Batteries-included application and mailer layouts.

> [!CAUTION]
> These features use trademarks of the University of Massachusetts Amherst. Usage of these trademarks is permitted only
> for internal, non-commercial use. See the license for more information.
>
> To guard against misuse, you must explicitly opt in to make them available for use:
>
> ```ruby
> # config/initializers/brand.rb
>
> UMTS::Brand.use_university_trademarks!
> ```

## Application

Two application layouts for public/private use. Both include a standard title tag, meta tags (including favicons),
link tags, script tags, a navbar and flashes. The public version adds an official university branded header and footer.

```ruby
class ApplicationController < ActionController::Base
  layout 'umts/brand/public' # for public facing apps
  # or
  layout 'umts/brand/private' # for internal apps
end
```

### Options

The following customizations are supported. These are intentionally as limited as possible to enforce consistency and
will be expanded only if absolutely necessary.

#### Title

Add a primary page title with a conventional `content_for :title` call.

```haml
-# your_view.html.haml
- content_for :title, 'My Page' # will produce "My Page * Department or Application * UMass Amherst
```

Customize the secondary page title using the following translations.

```yaml
en:
  application:
    name: "My App"
  umts:
    brand:
      department:
        name: "My Department" # if application.name is not defined
```

#### Flash

Implement custom flashes by adding a `flash` partial in your app's view path lookup chain.

```haml
-# app/view/application/_flash.html.haml

- if flash.present?
  .alert.alert-primary
    This will always be rendered in the flash section (you must conditionally
    render your content from the flash hash yourself).
```

#### Navbar

Implement your navbar by adding a `navbar` partial in your app's view path lookup chain.

```haml
-# app/view/application/_navbar.html.haml
%nav.navbar.navbar-expand
  -# ...
```

#### Department names (public only)

Customize the department names using the following translations.

```yaml
en:
  umts:
    brand:
      department:
        name: "My Department"
        parent_name: "My Department's Parent"
```

## Mailer

A mailer layout modeled after the official university marketing cloud template.

```ruby
class ApplicationMailer < ActionMailer::Base
  layout 'umts/brand/mailer'
end
```
