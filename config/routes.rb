Rails.application.routes.draw do
  # routes
  resources :user

  # Active_Admin 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Grape 
  mount Demo::API => '/'
end
