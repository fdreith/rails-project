class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books
  has_many :book_clubs
  belongs_to :genre
  belongs_to :author
  # has_many :favorited_quotes
  # has_many :annotations
  # has_many :recommendations

  validates :title, presence: true, uniqueness: true 
  validates :author_id, presence: true
  # validates :genre_id, presence: true
  validates :page_count, presence: true
end
