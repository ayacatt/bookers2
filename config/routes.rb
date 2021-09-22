Rails.application.routes.draw do
  get 'abouts/show'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy] do
  end
  resources :users, only: [:index, :show, :edit, :update] 
  end 
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  update 'users/:id' => 'books#destroy', as: 'destroy_book'