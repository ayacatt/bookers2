Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about'=> "homes#about"
  devise_for :users
  resources :books, only: [:new, :create, :edit, :update, :index, :show, :destroy] 
  resources :users, only: [:index, :show, :edit, :update] 
  resources :profile_images, only: [:new, :create, :index, :show, :destroy]
  end 
