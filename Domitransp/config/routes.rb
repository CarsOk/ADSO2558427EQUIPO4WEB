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
    resources :users, module: 'companies'
  end
  devise_for :users
  resources :invoices
  get "home/index"
  get "home/minor"
  root to: 'home#index'
  devise_for :users, skip: [:sessions, :registrations]
  resources :finanzas, only: [:index]
  resources :dispatches, only: [:index, :new, :create, :edit, :update]
  patch '/dispatches', to: 'dispatches#update_dispatches', as: 'update_dispatches'
end
