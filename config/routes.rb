# frozen_string_literal: true

Rails.application.routes.draw do

  resources :employees, path: 'employee'
  resources :projects
  resources :assignments
  resources :clients
  
  devise_for :employees, controllers:
  {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations',
  }
  
  get 'static_page/index'
  root 'static_page#index'
end
