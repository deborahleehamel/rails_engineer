Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :invoices,  only: [:index, :show]
      resources :merchants, only: [:index]
    end
  end
end
