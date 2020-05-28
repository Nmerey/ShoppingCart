Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :carts, only: [:show] do
  	resources :products, only: [:index]
  end

  resources :products, only: [:show, :index, :create, :new]
end
