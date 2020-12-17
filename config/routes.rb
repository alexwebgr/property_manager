Rails.application.routes.draw do
  get 'places/search'
  get 'sessions/login'
  resources :properties
  resources :transaction_types
  resources :users

  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
