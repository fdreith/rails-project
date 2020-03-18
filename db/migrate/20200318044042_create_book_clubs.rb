class CreateBookClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :book_clubs do |t|
      t.string :name
      t.string :passcode
      t.integer :book_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
