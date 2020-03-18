class BookClub < ApplicationRecord
  has_many :user_book_clubs
  has_many :users, through: :user_book_clubs
  belongs_to :book
  has_many :comments
end
