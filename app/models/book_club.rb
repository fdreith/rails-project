class BookClub < ApplicationRecord
  has_many :user_book_clubs
  has_many :users, through: :user_book_clubs
  belongs_to :book
  has_many :comments
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  validates :name, presence: true, uniqueness: true 
  validates :book_id, presence: true

  before_save do 
    self.title = name.titleize
  end
end
