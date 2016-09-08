Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      namespace :invoices do
        get "/find",     to: "find#show"
        get "/find_all", to: "find#index"
        get "/random",   to: "random#show"
      end
      namespace :items do
        get "/find", to: "find#show"
        get "/find_all",  to: "find#index"
      end
      namespace :merchants do
        get "/find",      to: "find#show"
        get "/find_all",  to: "find#index"
        get "/:id/items", to: "items#index"
        get "/:id/invoices", to: "invoices#index"
        get "/:id/customers_with_pending_invoices", to: "customer_pending_invoices#index"
      end
      namespace :transactions do
        get "/find",      to: "find#show"
        get "/find_all",  to: "find#index"
      end
      namespace :customers do
        get "/find",      to: "find#show"
        get "/find_all",  to: "find#index"
      end
    end
  end

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :invoices,     only: [:index, :show]
      resources :merchants,    only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :items,        only: [:index, :show]
      resources :customers,    only: [:index, :show]
    end
  end
end
