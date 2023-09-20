Rails.application.routes.draw do

  resources :orders do
    get 'index'

    member do
      get 'generar_pdf'
    end
    collection do
      get 'export_to_excel'
    end
  end
  devise_for :users
  get "home/index"
  get "home/minor"
  root to: 'home#index'

end
