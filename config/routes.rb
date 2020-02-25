Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
  	resource :relation_ships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :books do
	   resource :favorites, only: [:create, :destroy]
	   resource :post_comments, only: [:create, :destroy]
  end
  get 'home/about'
end