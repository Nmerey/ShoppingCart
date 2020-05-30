Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products, only: [:show, :index, :create, :new]
  resources :carts, only: [:show]

  get '/add_to_cart', to: 'products#add_to_cart', as: 'add_to_cart'

  root to: 'products#index'
end
