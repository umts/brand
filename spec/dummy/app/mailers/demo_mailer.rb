# frozen_string_literal: true

class DemoMailer < ApplicationMailer
  def demo
    mail to: 'recipient@admin.umass.edu'
  end
end
