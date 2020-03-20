class Genre < ApplicationRecord
  has_many :books

  validates :name, presence: true, uniqueness: true 

  before_save do 
    self.title = name.titleize
  end
end
