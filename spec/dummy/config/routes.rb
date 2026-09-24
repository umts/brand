# frozen_string_literal: true

Rails.application.routes.draw do
  root 'demos#index'

  resources :integrations, only: [] do
    collection do
      get :tabbed
    end
  end
end
