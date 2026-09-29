# frozen_string_literal: true

class DemoMailerPreview < ActionMailer::Preview
  delegate :demo, to: :DemoMailer
end
