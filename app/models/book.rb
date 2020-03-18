class Book < ApplicationRecord
  has_many :users, through: :user_books
  has_many :book_clubs
  # has_many :favorited_quotes
  # has_many :annotations
  # has_many :recommendations
end
