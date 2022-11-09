class User < ApplicationRecord
    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email
    validates_presence_of :name
    validates_presence_of :age
    validates_presence_of :gender
    validates_presence_of :city
    validates_presence_of :state
    validates_presence_of :is_type


    # has_one :doctor OR has_one :pacient
    has_one :doctor
    has_one :pacient
    
end
