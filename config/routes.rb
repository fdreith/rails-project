Rails.application.routes.draw do

  root "static#home"

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :book_clubs, only: [:show] do 
    resources :comments, only: [:index, :new]
  end

  resources :authors, only: [:show] do 
    resources :books, only: [:index, :show, :new]
  end

  resources :genres, only: [:show] do 
    resources :books, only: [:index, :show]
  end

  resources :user_books
  resources :authors
  resources :genres
  resources :book_clubs
  resources :users
  resources :books
  resources :comments
  resources :user_book_clubs

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
