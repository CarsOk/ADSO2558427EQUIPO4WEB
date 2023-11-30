Rails.application.routes.draw do

  get 'finanzas/index'
  resources :orders do
    member do
      get 'generar_pdf'
    end
    collection do
      get 'export_to_excel'
    end
  end
  resources :companies do
    member do
      delete 'delete', to: 'companies#destroy', as: 'delete'
    end
  end
  resources :companies do
    resources :users, module: 'companies'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions/sessions'
  }
  resources :invoices
  get "home/index"
  get "home/minor"
  root to: 'home#index'
  resources :finanzas, only: [:index]
  resources :dispatches
  patch '/dispatches', to: 'dispatches#update_dispatches', as: 'update_dispatches'
  resources :pages
  get '/acerca', to: 'pages#acerca', as: 'acerca'
end
