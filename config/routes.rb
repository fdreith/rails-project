Rails.application.routes.draw do
  resources :user_books
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
end
