class Book < ApplicationRecord
  default_scope { order(title: :asc)}
  scope :by_author, ->(author_id) { where("author_id = ?", author_id)}
  scope :by_genre, ->(genre_id) { where("genre_id = ?", genre_id)}
  scope :by_page_count, ->(page_count) { where("page_count <= ?", page_count)}
  # scope :quick_read, -> { where("page_count <= 200")}

  has_many :user_books
  has_many :users, through: :user_books
  has_many :book_clubs
  belongs_to :genre
  belongs_to :author
  # has_many :favorited_quotes
  # has_many :annotations
  # has_many :recommendations

  validates :title, presence: true, uniqueness: true 
  validates :page_count, presence: true


  before_save do 
    self.title = title.titleize
  end

  def author_attributes=(author_attributes)
    if !author_attributes.values.first.empty?
      self.author = Author.find_or_create_by(author_attributes)
    end
  end

  def genre_attributes=(genre_attributes)
    if !genre_attributes.values.first.empty?
      self.genre = Genre.find_or_create_by(genre_attributes)
    end
  end

end
