Rails.application.routes.draw do
  devise_for :users
    root to: "users#index"#user page
    resources :users, only: [:index, :destroy, :admin]
    get 'admin' => 'users#admin'
    

    resources :subscriptions, only: [:index, :create, :destroy]

    resources :tweets, only: [:index, :create]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
