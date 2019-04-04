Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: "tweets#index"

  resources :replies, only: [:index]
  resources :subscriptions, only: [:index, :create, :destroy]
  resources :tweets, only: [:index, :create] do
    post :reply
  end

  namespace :admin do
    root to: "users#index"
    resources :users, only: [:index, :destroy, :admin]
  end
end
