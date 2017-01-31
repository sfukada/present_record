Rails.application.routes.draw do
  devise_for :users
  root 'presents#index'
  get 'presents' => 'presents#index'
  resources :presents
end