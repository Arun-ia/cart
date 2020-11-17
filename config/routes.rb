Rails.application.routes.draw do
  resources :carts
  resources :products
  root 'products#index'

end