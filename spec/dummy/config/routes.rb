# frozen_string_literal: true

Rails.application.routes.draw do
  root 'demos#index'
  get 'bootstrap', to: 'demos#bootstrap'
  get 'fullcalendar', to: 'demos#fullcalendar'
  get 'datatables', to: 'demos#datatables'
  get 'tom_select', to: 'demos#tom_select'
end
