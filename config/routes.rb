Rails.application.routes.draw do
  devise_for :users
  root to: 'members#index'
  resources :users
  resources :members do
    resources :posts
    resources :comments, only: [:create] 
  end
  resources :items
end
