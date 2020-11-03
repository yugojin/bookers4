Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit,:create,:update]
  resources :books, only: [:show, :index, :edit,:create,:update,:destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about'
end
