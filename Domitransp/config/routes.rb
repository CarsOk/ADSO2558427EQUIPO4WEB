Rails.application.routes.draw do

  resources :orders do
    collection do
      get 'index'
    end
  end
  devise_for :users
  get "home/index"
  get "home/minor"
  root to: 'home#index'

end
