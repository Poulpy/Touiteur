Rails.application.routes.draw do
  resources :replies
  devise_for :users

  root to: "tweets#index"

  resources :subscriptions, only: [:index, :create, :destroy]
  resources :tweets, only: [:index, :create]

  namespace :admin do
    root to: "users#index"
    resources :users, only: [:index, :destroy, :admin]
  end
end
