class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true, uniqueness: true 

  before_save do 
    self.name = name.titleize
  end

end
