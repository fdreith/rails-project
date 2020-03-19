Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :user_book_clubs
  resources :book_clubs, only: [:show] do 
    resources :comments, only: [:index, :new]
  end
  resources :comments
  resources :authors, only: [:show] do 
    resources :books, only: [:index, :show]
  end
  resources :genres, only: [:show] do 
    resources :books, only: [:index, :show]
  end
  resources :user_books
  resources :users
  resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
end
