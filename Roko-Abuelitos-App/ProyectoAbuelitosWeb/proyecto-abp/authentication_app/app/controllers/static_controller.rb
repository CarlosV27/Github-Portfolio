class StaticController < ApplicationController 
    def home 
        # render: json: {
        #     status: "It's working!",
        # }
        render json: {  
            status: "It's working!",
            message: "Welcome to the Rails API",
        }
    end 

    def otherHome 
        
        # 

        render json: {  
            status: "It's working!, But is other home",
            message: "Welcome to the Rails API",
            # display all pacients
            # pacients: Pacient.all,
            users: User.all,

                
            # display all the pacients that have a user_id 
            pacients: Pacient.where.not(user_id: nil), 
            # display its corresponding user
            doctor: Doctor.where.not(user_id: nil), #display the doctor that have a user_id
            
            # display users who are doctors or pacients
            all_pacients_and_doctors: User.where(
                is_type: [
                    "doctor",
                    "pacient"
                ]
            ),
                
             # display all the pacients and its emails, name and age


            
        }

    end
end 