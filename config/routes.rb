Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # Set the root route to the index action of the CustomersController
  root to: 'customers#index'

  # Define routes for the CustomersController actions
  resources :customers do
    collection do
      get 'missing_email', to: 'customers#missing_email'
      get 'alphabetized', to: 'customers#alphabetized'
    end
  end
end
