Rails.application.routes.draw do

  resources :orders
  devise_for :users
  get "home/index"
  get "home/minor"
  root to: 'home#index'

end
