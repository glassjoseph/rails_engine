Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #add /api/v1/transactions/find_all?result=

  # GET /api/v1/merchants.json

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      namespace :merchants do
        get "/find", to: 'find#show'
        get "/find_all", to: 'find#index'
        get "/random", to: 'random#show'
        get "/most_items", to: 'items#show'
        get "/most_revenue", to: "most_revenue#index"
        get "revenue", to: "revenues#index"
      end

      resources :merchants, only: [:index, :show] do
        get "/revenue", to: 'merchants/revenues#show'
        get "/invoices", to: 'merchants/invoices#show'
        get "/items", to: 'merchants/items#show'
        get "/customers_with_pending_invoices", to: 'merchants/pending_invoices#show'
        get "/favorite_customer", to: 'merchants/favorite_customers#show'
      end

      namespace :invoices do
        get "/find", to: 'find#show'
        get "/find_all", to: 'find#index'
        get "/random", to: 'random#show'
      end

      resources :invoices, only: [:index, :show] do
        get "/transactions", to: "invoices/transactions#index"
        get "/invoice_items", to: "invoices/invoice_items#index"
        get "/items", to: "invoices/items#index"
        get "/customer", to: "invoices/customers#show"
        get "/merchant", to: "invoices/merchants#show"
      end


      namespace :invoice_items do
        get "/find", to: 'find#show'
        get "/find_all", to: 'find#index'
        get "/random", to: 'random#show'
      end

      resources :invoice_items, only: [:index, :show] do
        get "/invoice", to: 'invoice_items/invoices#show'
        get "/item", to: 'invoice_items/items#show'
      end

      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
        get '/most_items', to: 'most_sold#show'
        get '/most_revenue', to: 'most_revenue#index'
      end

      resources :items, only: [:index, :show] do
        get "/merchant", to: 'items/merchants#show'
        get "/invoice_items", to: 'items/invoice_items#index'
        get "/best_day", to: 'items/best_days#show'
      end



      namespace :customers do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end

      resources :customers, only: [:index, :show] do
        get "/invoices", to: 'customers/invoices#show'
        get "/transactions", to: 'customers/transactions#show'
        get "/favorite_merchant", to: 'customers/favorite_merchants#show'
      end

      namespace :transactions do
        get "/find", to: 'find#show'
        get "/find_all", to: 'find#index'
        get "/random", to: 'random#show'
      end

      resources :transactions, only: [:index, :show] do
        get "/invoice", to: 'transactions/invoices#show'
      end

    end
  end
end
