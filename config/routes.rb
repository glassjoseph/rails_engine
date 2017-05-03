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

      namespace :invoices do
        get "/find", to: 'find#show'
        get "/find_all", to: 'find#index'
        get "/random", to: 'random#show'
      end

      resources :merchants, only: [:index, :show] do
        get "/revenue", to: 'merchants/revenues#show'
        get "/invoices", to: 'merchants/invoices#show'
      end

      resources :items, only: [:index, :show]
        get "/merchants", to: 'items/merchants#show'

      resources :invoices, only: [:index, :show]


      resources :invoice_items, only: [:index, :show]
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
