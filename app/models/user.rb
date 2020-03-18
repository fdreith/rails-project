class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books
  has_many :user_book_clubs
  has_many :book_clubs, through: :user_book_clubs
  has_many :comments
  has_many :owned_clubs, class_name: "BookClub", foreign_key: "owner_id"
  
  # has_many :favorited_quotes
  # has_many :annotations
  # has_many :recommendations


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(
           name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end 
end
