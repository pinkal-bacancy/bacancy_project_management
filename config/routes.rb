# frozen_string_literal: true

Rails.application.routes.draw do
  resources :employees
  resources :projects
  resources :assignments
  resources :clients
  
  devise_for :employees
 
  get 'static_page/index'
  root 'static_page#index'
end
