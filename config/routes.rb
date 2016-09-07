Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :invoices,  only: [:index, :show]
      resources :merchants, only: [:index, :show]
    end
  end

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      namespace :invoices do
        get "/find",     to: "find#show"
        get "/find_all", to: "find#index"
      end
      namespace :merchants do
        get "/find"
      end
    end
  end
end
