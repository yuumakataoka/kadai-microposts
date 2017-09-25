Rails.application.routes.draw do

  get 'relationships/create'

  get 'relationships/destroy'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root to: "toppages#index"

  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
    collection do
      get :search
    end
  end  
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
