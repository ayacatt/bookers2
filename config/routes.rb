Rails.application.routes.draw do
  get 'abouts/show'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :edit, :update, :index, :show, :destroy] do
  end
  resources :users, only: [:index, :show, :edit, :update] 
  end 
