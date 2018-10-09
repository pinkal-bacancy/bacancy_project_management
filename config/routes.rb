# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources :employees,path: 'employee'
  get "/unique_employee" => "employees#unique_employee"
  get "/unique_username" => "employees#unique_username"
  get "/change_role" => "employees#change_role"
  get "/unique_client_email" => "clients#unique_client_email"
  resources :projects
  resources :assignments
  resources :clients
  resources :technologies
  
  devise_for :employees, controllers:
  {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations',
  }
  
  get 'static_page/index'
  root 'static_page#index'
end
