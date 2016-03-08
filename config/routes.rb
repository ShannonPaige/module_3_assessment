Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  resources :search, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :items, except: [:new, :update, :edit], defaults: {format: :json}
    end

  end
end
