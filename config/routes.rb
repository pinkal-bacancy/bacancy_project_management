Rails.application.routes.draw do
  get 'clients/new'
  get 'clients/index'
  get 'clients/edit'
  get 'clients/show'
  get 'assignments/new'
  get 'assignments/index'
  get 'assignments/edit'
  get 'assignments/show'
  get 'projects/new'
  get 'projects/index'
  get 'projects/edit'
  get 'projects/show'
  devise_for :employees
  # root 	to: "employees/sessions#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
