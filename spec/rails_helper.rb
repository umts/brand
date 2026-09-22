# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative 'dummy/config/environment'
require 'rspec/rails'

RSpec.configure do |config|
  config.filter_rails_from_backtrace!

  config.before :each, type: :system do
    driven_by :rack_test
  end

  config.before :each, :js, type: :system do
    driven_by :selenium, using: :headless_chrome
  end
end
