# frozen_string_literal: true

Rails.application.routes.draw do
  next unless UMTS::Brand.using_dynamic_error_pages

  Rack::Utils::HTTP_STATUS_CODES.each_key do |code|
    match "/#{code}", to: 'umts/brand/errors#show', code: code, via: :all if code >= 400
  end
end
