class Comment < ApplicationRecord
  belongs_to :book_club
  belongs_to :user

  validates :content, presence: true

end
