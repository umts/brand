# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :flash_from_session

  layout :layout_from_session

  private

  def flash_from_session
    return unless session[:toggle_flash]

    model = Demo.new.tap(&:validate)
    flash_success_now_for(model, :create)
    flash_errors_now_for(model)
  end

  def layout_from_session = "umts/brand/#{session[:toggle_layout] ? 'private' : 'public'}"
end
