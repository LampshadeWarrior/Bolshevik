Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :comments
  resources :users, only: [:show]
end
