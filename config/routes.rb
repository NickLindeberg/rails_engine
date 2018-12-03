Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/find', to: 'merchant_find#show'
        get '/find_all', to: 'merchant_find#index'
      end
      resources :merchants, only: [:index, :show]

      namespace :items do
        get '/find', to: 'item_find#show'
        get '/find_all', to: 'item_find#index'
      end
      resources :items, only: [:index, :show]

      namespace :transactions do
        get '/find', to: 'transaction_find#show'
        get '/find_all', to: 'transaction_find#index'
      end
      resources :transactions, only: [:index, :show]

      namespace :customers do
        get '/find', to: 'customer_find#show'
        get '/find_all', to: 'customer_find#index'
      end
      resources :customers, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'invoice_item_find#show'
        get '/find_all', to: 'invoice_item_find#index'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'invoice_find#show'
        get '/find_all', to: 'invoice_find#index'
      end
      resources :invoices, only: [:index, :show]
    end
  end
end
