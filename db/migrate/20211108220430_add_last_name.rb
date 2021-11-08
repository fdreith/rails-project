class AddLastName < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string, :after => :first_name
  end
end
