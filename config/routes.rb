Rails.application.routes.draw do
  devise_for :users
  root 'presents#index'
  get 'presents' => 'presents#index'
  get 'presents/new' => 'presents#new'
  post 'presents' => 'presents#create'
end