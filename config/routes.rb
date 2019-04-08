Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  root to: "tweets#index"

  resources :replies, only: [:index]
  resources :subscriptions, only: [:index, :create, :destroy]
  resources :tweets, only: [:index, :create] do
    post :reply

    post :like, on: :member
    delete :unlike, on: :member
  end

  namespace :admin do
    root to: "users#index"
    resources :users, only: [:index, :destroy, :admin]
  end
end
