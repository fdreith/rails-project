Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :comments
  resources :user_book_clubs
  resources :book_clubs
  resources :authors
  resources :genres
  resources :user_books
  resources :users
  resources :books

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
end
