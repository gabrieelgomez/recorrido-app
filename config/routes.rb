Rails.application.routes.draw do
  resources :employees

  resources :companies do
    member do
      get :shifts
    end
  end

  resources :service_hours, only: %i[update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'companies#index'
end
