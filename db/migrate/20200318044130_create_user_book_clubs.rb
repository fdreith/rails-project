class CreateUserBookClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_book_clubs do |t|
      t.integer :book_club_id
      t.integer :user_id

      t.timestamps
    end
  end
end
