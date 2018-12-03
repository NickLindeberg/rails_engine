Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

#### MERCHANTS
      namespace :merchants do
        get '/find', to: 'merchant_find#show'
        get '/find_all', to: 'merchant_find#index'
        get '/random', to: 'merchant_random#show'
      end
      scope module: 'merchants' do
        resources :merchants do
          get '/items', to: 'merchant_items#index'
          get '/invoices', to: 'merchant_invoices#index'
        end
      end
      resources :merchants, only: [:index, :show]

#### ITEMS
      namespace :items do
        get '/find', to: 'item_find#show'
        get '/find_all', to: 'item_find#index'
        get '/random', to: 'item_random#show'
        get '/best_day' to: 'item_best_day#show'
      end
      scope module: 'items' do
        resources :items do
          get '/invoice_items', to: 'item_invoice_items#index'
          get '/merchant', to: 'item_merchant#show'
        end
      end
      resources :items, only: [:index, :show]

#### TANSACTIONS
      namespace :transactions do
        get '/find', to: 'transaction_find#show'
        get '/find_all', to: 'transaction_find#index'
        get '/random', to: 'transaction_random#show'
      end
      scope module: 'transactions' do
        resources :transactions do
          get '/invoice', to: 'transaction_invoice#show'
        end
      end
      resources :transactions, only: [:index, :show]

#### CUSTOMERS
      namespace :customers do
        get '/find', to: 'customer_find#show'
        get '/find_all', to: 'customer_find#index'
        get '/random', to: 'customer_random#show'

      end
      scope module: 'customers' do
        resources :customers do
          get '/invoices', to: 'customer_invoices#index'
          get '/transactions', to: 'customer_transactions#index'
        end
      end
      resources :customers, only: [:index, :show]
#### INVOICE ITEMS
      namespace :invoice_items do
        get '/find', to: 'invoice_item_find#show'
        get '/find_all', to: 'invoice_item_find#index'
        get '/random', to: 'invoice_item_random#show'
      end
      scope module: 'invoice_items' do
        resources :invoice_items do
          get '/invoice', to: 'invoice_item_invoice#show'
          get '/item', to: 'invoice_item_item#show'
        end
      end
      resources :invoice_items, only: [:index, :show]

#### INVOICES
      namespace :invoices do
        get '/find', to: 'invoice_find#show'
        get '/find_all', to: 'invoice_find#index'
        get '/random', to: 'invoice_random#show'
      end
      scope module: 'invoices' do
        resources :invoices do
          get '/transactions', to: 'invoice_transactions#index'
          get '/invoice_items', to: 'invoice_invoice_items#index'
          get '/items', to: 'invoice_items#index'
          get '/customer', to: 'invoice_customer#show'
          get '/merchant', to: 'invoice_merchant#show'
        end
      end
      resources :invoices, only: [:index, :show]
    end
  end
end
