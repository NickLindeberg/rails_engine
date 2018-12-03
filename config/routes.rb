Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/find', to: 'merchant_find#show'
        get '/find_all', to: 'merchant_find#index'
        get '/random', to: 'merchant_random#show'

      end
      resources :merchants, only: [:index, :show]

      namespace :items do
        get '/find', to: 'item_find#show'
        get '/find_all', to: 'item_find#index'
        get '/random', to: 'item_random#show'
      end
      resources :items, only: [:index, :show]

      namespace :transactions do
        get '/find', to: 'transaction_find#show'
        get '/find_all', to: 'transaction_find#index'
        get '/random', to: 'transaction_random#show'

      end
      resources :transactions, only: [:index, :show]

      namespace :customers do
        get '/find', to: 'customer_find#show'
        get '/find_all', to: 'customer_find#index'
        get '/random', to: 'customer_random#show'

      end
      resources :customers, only: [:index, :show]

      namespace :invoice_items do
        get '/find', to: 'invoice_item_find#show'
        get '/find_all', to: 'invoice_item_find#index'
        get '/random', to: 'invoice_item_random#show'

      end
      resources :invoice_items, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'invoice_find#show'
        get '/find_all', to: 'invoice_find#index'
        get '/random', to: 'invoice_random#show'

      end
      resources :invoices, only: [:index, :show]
    end
  end
end
