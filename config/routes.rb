Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  resource :favorites, only: [:create, :destroy]
  resource :post_comments, only: [:create, :destroy]
  get 'home/about'
end