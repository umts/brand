# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'umts-brand@admin.umass.edu'
  layout 'umts/brand/mailer'
end
