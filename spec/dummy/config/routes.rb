# frozen_string_literal: true

Rails.application.routes.draw do
  root 'demos#index'

  post :toggle_flash, to: 'session#toggle_flash'
  post :toggle_layout, to: 'session#toggle_layout'
end
