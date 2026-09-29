# Trademarks

Official university branded layout and favicon components. Should be used on all public pages (specifically any
page accessible by user outside Transportation).

> [!CAUTION]
> These features use trademarks of the University of Massachusetts Amherst. Usage of these trademarks is permitted only
> for internal, non-commercial use. See the license for more information.
>
> To guard against misuse, you must explicitly opt in to make these views available for use:
>
> ```ruby
> # config/initializers/brand.rb
>
> UMTS::Brand.use_university_trademarks!
> ```

## mailer

A mailer layout modeled after the official university marketing cloud template.

```ruby
class ApplicationMailer < ActionMailer::Base
  layout 'umts/brand/mailer'
end
```

## umts_brand_favicons

A helper that renders link tags for the official university favicon.

```haml
= umts_brand_favicons
```

## university_header

A view partial containing the official public page header.

```haml
= render partial: 'umts/brand/university_header',
         locals: { parent_department_name: 'Facilities & Campus Services',
                   parent_department_link: 'https://www.umass.edu/facilities',
                   department_name: 'Transportation Services',
                   department_link: 'https://www.umass.edu/transportation' }
```

## university_footer

A view partial containing the official public page footer.

```haml
= render partial: 'umts/brand/university_footer'
```
