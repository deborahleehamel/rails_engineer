Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      namespace :invoices do
        get "/find",              to: "find#show"
        get "/find_all",          to: "find#index"
        get "/random",            to: "random#show"
        get "/:id/transactions",  to: "transactions#index"
        get "/:id/items",         to: "items#index"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/customer",      to: "customers#show"
        get "/:id/merchant",      to: "merchants#show"
      end
      namespace :invoice_items do
        get "/:id/item",    to: "items#show"
        get "/:id/invoice", to: "invoices#show"
      end
      namespace :items do
        get "/find",              to: "find#show"
        get "/find_all",          to: "find#index"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/merchant",      to: "merchants#show"
      end
      namespace :merchants do
        get "/find",         to: "find#show"
        get "/find_all",     to: "find#index"
        get "/:id/items",    to: "items#index"
        get "/:id/invoices", to: "invoices#index"
        get "/:id/customers_with_pending_invoices", to: "customer_pending_invoices#index"
        get "/:id/revenue"   to: "revenues#show"
      end
      namespace :transactions do
        get "/find",      to: "find#show"
        get "/find_all",  to: "find#index"
        get "/:id/invoice", to: "invoices#show"
      end
      namespace :customers do
        get "/find",      to: "find#show"
        get "/find_all",  to: "find#index"
        get "/:id/invoices", to: "invoices#index"
        get "/:id/transactions", to: "transactions#index"
      end
    end
  end

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :invoices,      only: [:index, :show]
      resources :merchants,     only: [:index, :show]
      resources :transactions,  only: [:index, :show]
      resources :items,         only: [:index, :show]
      resources :customers,     only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
