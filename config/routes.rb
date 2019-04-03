Rails.application.routes.draw do
  devise_for :users
    root to: "users#index"#user page
    resources :users, only: [:index]

    resources :subscriptions, only: [:follow, :unfollow, :show]
    post 'follow' => 'subscriptions#follow'# follow a user
    post 'unfollow' => 'subscriptions#unfollow'# unfollow a user
    get 'portal_show'  => 'subscriptions#show'

    resources :tweets, only: [:tweets_page, :create]
    get 'tweets_page' => 'tweets#tweets_page'# page of all tweets
    post 'tweets_page' => 'tweets#create'# creation of a tweet
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
