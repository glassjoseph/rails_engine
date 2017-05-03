Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  # GET /api/v1/merchants.json

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      namespace :merchants do
        get "/find", to: 'find#show'
        get "/find_all", to: 'find#index'
        get "/random", to: 'random#show'
      end

      resources :merchants, only: [:index, :show] do
        get "/revenue", to: 'merchants/revenues#show'
        get "/invoices", to: 'merchants/invoices#show'
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
        get "/customer", to: "invoices/customers#index"
        get "/merchant", to: "invoices/merchants#index"
      end


      namespace :invoice_items do
        get "/find", to: 'find#show'
        get "/find_all", to: 'find#index'
        get "/random", to: 'random#show'
      end


      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      resources :items, only: [:index, :show] do
        get "/merchants", to: 'items/merchants#show'
      end



      resources :invoice_items, only: [:index, :show]

      namespace :customers do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
      end

      resources :customers, only: [:index, :show]

      namespace :transactions do
        get "/find", to: 'find#show'
        get "/find_all", to: 'find#index'
        get "/random", to: 'random#show'
      end

      resources :transactions, only: [:index, :show]


    end
  end
end
