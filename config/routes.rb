Rails.application.routes.draw do
  devise_for :employees, controllers:
  {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations',
  }
  
  resources :projects
  get 'clients/new'
  get 'clients/index'
  get 'clients/edit'
  get 'clients/show'
  get 'assignments/new'
  get 'assignments/index'
  get 'assignments/edit'
  get 'assignments/show'
 	
  get 'static_page/index'
  root 'static_page#index'

end
