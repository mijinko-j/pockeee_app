Rails.application.routes.draw do
  devise_for :users
  root to: 'members#index'
  resources :members, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users
end
