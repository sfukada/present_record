Rails.application.routes.draw do
  devise_for :users
  root 'presents#index'
  get 'presents' => 'tweets#index'
  get 'presents/new' => 'presents#new'
end