class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :string
    add_column :users, :gender, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
