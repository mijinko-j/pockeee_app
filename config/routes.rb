Rails.application.routes.draw do
  devise_for :users
  root to: 'members#index'
  resources :users
  resources :members do
    resources :posts
  end
  resources :items
  get 'report', to: 'posts#report'
end
