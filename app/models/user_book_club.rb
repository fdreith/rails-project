class UserBookClub < ApplicationRecord
  belongs_to :book_club
  belongs_to :user
end
