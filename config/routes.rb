Rails.application.routes.draw do
  devise_for :users
  root to: 'members#index'
  resources :users, only: [:show]
  resources :members do
    resources :posts
    resources :comments, only: [:index, :create] 
  end
  resources :items, only: [:index, :new, :create, :edit, :update]
end
