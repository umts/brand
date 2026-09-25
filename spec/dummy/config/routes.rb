# frozen_string_literal: true

Rails.application.routes.draw do
  root 'demos#index'
  get 'bootstrap', to: 'demos#bootstrap'
end
