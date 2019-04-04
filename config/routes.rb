Rails.application.routes.draw do
  devise_for :users
    root to: "users#index"#user page
    resources :users, only: [:index, :destroy, :admin]
    get 'admin' => 'users#admin'
    

    resources :subscriptions, only: [:follow, :unfollow, :show]
    post 'follow' => 'subscriptions#follow'# follow a user
    post 'unfollow' => 'subscriptions#unfollow'# unfollow a user
    get 'portal_show'  => 'subscriptions#show'

    resources :tweets, only: [:index, :create]
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
