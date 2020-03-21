class Genre < ApplicationRecord
  has_many :books

  validates :name, presence: true, uniqueness: true 

  default_scope { order(name: :asc)}

  before_save do 
    self.name = name.titleize
  end
end
