Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/find', to: 'merchant_find#show'
        get '/find_all', to: 'merchant_find#index'
      end
      resources :merchants, only: [:index, :show]

      resources :items, only: [:index, :show]
      resources :transactions, only: [:index, :show]

      namespace :customers do
        get '/find', to: 'customer_find#show'
        get '/find_all', to: 'customer_find#index'
      end
      resources :customers, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
    end
  end
end
