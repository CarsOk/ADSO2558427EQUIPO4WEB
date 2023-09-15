Rails.application.routes.draw do

  resources :orders do
    collection do
      get 'index'
      get 'generar_pdf'
      get 'export_to_excel', defaults: { format: :xlsx }
    end
  end
  devise_for :users
  get "home/index"
  get "home/minor"
  root to: 'home#index'

end
