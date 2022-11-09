class Doctor < ApplicationRecord
    belongs_to :user

    # create a new doctor
    def self.createDoctor(params)
        user = User.new
        user.name = params[:name]
        user.email = params[:email]
        user.password = params[:password]
        user.age = params[:age]
    end 

    has_many :pacients
   

end
