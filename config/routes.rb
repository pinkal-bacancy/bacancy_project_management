Rails.application.routes.draw do
  devise_for :employees
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
  get 'static_page/index'
  root 'static_page#index'

end
