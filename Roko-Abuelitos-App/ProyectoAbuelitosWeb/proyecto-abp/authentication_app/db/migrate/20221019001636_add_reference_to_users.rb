class AddReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :doctor, foreign_key: true
    add_reference :users, :pacient, foreign_key: true


    # add column to doctor
    # add_column :doctors, :user_id, foreign_key: true

    # doctor belongs to user
    add_reference :doctors, :user, foreign_key: true

    # add column to pacient
    # add_column :pacients, :user_id, foreign_key: true
    # add_column :pacients, :doctor_id, foreign_key: true

    # pacients belongs to user and doctor
    add_reference :pacients, :user, foreign_key: true
    add_reference :pacients, :doctor, foreign_key: true

    
    # :doctors belongs_to :user, index: true, foreign_key: true,


    # added new collumns to users
    add_column :users, :is_type, :string
  end
end
