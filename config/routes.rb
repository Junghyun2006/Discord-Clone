Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
  
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create, :index, :show, :update]
    resources :servers, only: [:create, :show, :destroy, :update, :index] do
      resources :channels, only: [:index]
    end
    resources :subscriptions, only: [:create, :destroy, :update, :index] 
    resource :session, only: [:create, :destroy]
    resources :channels, only: [:show, :create, :update, :destroy] do
      resources :messages, only: [:index]
    end

  end
  
  root to: 'static_pages#root'
end

