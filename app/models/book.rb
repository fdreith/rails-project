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
  validates :genre_id, presence: true
  validates :page_count, presence: true

  accepts_nested_attributes_for :author
  accepts_nested_attributes_for :genre

  # def author_attributes=(author_attributes)
  #   author_attributes.values.each do |author_attribute|
  #     if author_attribute["name"].present?
  #       author = Author.find_or_create_by(author_attirbute)
  #     end
  #   end
  # end

  # def author_attributes=(author_attributes)
  #   self.author = Author.find_or_create_by(name: author_attributes[:name]) unless author_attirbutes[:name].blank?
  # end

end
