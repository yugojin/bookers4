Rails.application.routes.draw do
  devise_for :users
  root :to => 'books#top'
  get 'homes/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit,:create,:update]
  resources :books, only: [:show, :index, :edit,:create,:update,:destroy]
  resources :homes, only: [:show, :index]
end
