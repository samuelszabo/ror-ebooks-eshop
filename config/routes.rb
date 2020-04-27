Rails.application.routes.draw do
  resources :prices
  resources :products
  devise_for :users
  root 'page#home'
  get 'page/help'

  resources :posts

  resources :carts
  post '/carts' => 'cart#create', :as => 'add_to_cart'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
