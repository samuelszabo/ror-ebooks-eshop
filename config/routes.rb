# frozen_string_literal: true

Rails.application.routes.draw do
  resources :payments
  resources :order_items
  resources :order_items_download
  resources :orders
  resources :addresses
  resources :prices
  resources :products
  devise_for :users
  root 'page#home'
  get 'page/help'

  resources :posts

  resources :carts
  post '/carts' => 'cart#create', :as => 'add_to_cart'

  post '/payments' => 'payments#create', :as => 'create_payment'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
