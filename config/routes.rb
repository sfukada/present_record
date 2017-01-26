Rails.application.routes.draw do
  get 'presents' => 'presents#index'
  get 'tweets/new' => 'presents#new'
end