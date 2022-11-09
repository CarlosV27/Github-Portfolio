class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :speciality
      t.string :photo
      t.string :consulting_room

      t.timestamps
    end
  end
end
