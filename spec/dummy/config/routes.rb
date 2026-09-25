# frozen_string_literal: true

Rails.application.routes.draw do
  root 'demos#index'
  get 'bootstrap', to: 'demos#bootstrap'
  get 'tom_select', to: 'demos#tom_select'
end
