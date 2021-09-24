Rails.application.routes.draw do
  get 'home/about'=> "home#about"
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :edit, :update, :index, :show, :destroy] do
  end
  resources :users, only: [:index, :show, :edit, :update] 
  end 
