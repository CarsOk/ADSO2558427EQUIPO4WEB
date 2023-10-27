Rails.application.routes.draw do

  get 'finanzas/index'
  resources :orders do
    get 'index'

    member do
      get 'generar_pdf'
    end
    collection do
      get 'export_to_excel'
    end
  end
  resources :companies do
    resources :users, module: 'companies'
  end
  devise_for :users, controllers: { sessions: 'users/sessions/sessions' }
  resources :invoices
  get "home/index"
  get "home/minor"
  root to: 'home#index'
  resources :finanzas, only: [:index]
  resources :dispatches, only: [:index, :new, :create, :edit, :update]
  patch '/dispatches', to: 'dispatches#update_dispatches', as: 'update_dispatches'
end
