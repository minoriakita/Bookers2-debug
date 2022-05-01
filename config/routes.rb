Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about", as: 'about'
  get "search" => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
end
  resources :users, only: [:index,:show,:edit,:update] do
  resource :relationships, only: [:create, :destroy]

  get 'relationships/followings', as: 'followings'
  get 'relationships/followers', as: 'followers'
end

end