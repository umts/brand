# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :flash_from_session

  layout :layout_from_session

  private

  def flash_from_session
    return unless session[:toggle_flash]

    flash.now[:alert] = Faker::Lorem.paragraph(sentence_count: 5)
    flash.now[:notice] = Faker::Lorem.paragraph(sentence_count: 5)
  end

  def layout_from_session = "umts/brand/#{session[:toggle_layout] ? 'private' : 'public'}"
end
