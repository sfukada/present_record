Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root 'presents#index'
  get 'presents' => 'presents#index'
  resources :presents
  get 'rakuten_search' => 'presents#show'
end