Rails.application.routes.draw do
    resources :subscriptions
    get 'login' => 'portal#login'
    post 'login' => 'portal#check'
    get 'user_page' => 'portal#tweets_page'
    get 'user_page/:id' => 'portal#tweets_page'
    post 'user_page' => 'portal#create'
    get 'logout' => 'portal#logout'
    post 'follow' => 'portal#follow'
    post 'unfollow' => 'portal#unfollow'
    get 'portal'  => 'portal#index'
    get '' => 'portal#index'
    get 'index' => 'portal#index'
    get 'portal_show'  => 'portal#show'
    resources :tweets
    resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
