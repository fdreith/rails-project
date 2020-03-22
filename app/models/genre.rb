class Genre < ApplicationRecord
  default_scope { order(name: :asc)}
  
  has_many :books

  validates :name, presence: true, uniqueness: true 

  before_save do 
    self.name = name.titleize
  end
end
