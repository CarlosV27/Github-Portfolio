class CreatePacients < ActiveRecord::Migration[7.0]
  def change
    create_table :pacients do |t|
      t.integer :height
      t.integer :weight
      t.string :blood
      t.string :diseases
      t.string :zone
      t.string :church
      t.string :postal_code

      t.timestamps
    end
  end
end
