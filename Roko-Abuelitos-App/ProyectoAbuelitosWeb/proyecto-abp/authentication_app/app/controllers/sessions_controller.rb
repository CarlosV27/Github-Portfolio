class SessionsController < ApplicationController
    include CurrentUserConcern
  
    def create # here the API makes the request 
      user = User
              .find_by(email: params["user"]["email"]) #Params is what the front end sends to the backend 
              .try(:authenticate, params["user"]["password"]) #["name"]["age"]["gender"]["city"]["state"]
  
      if user  # here cookies had a conection
        session[:user_id] = user.id
        render json: {
          status: :created,
          logged_in: true,
          user: user,
          name: user.name,
          age: user.age,
          gender: user.gender,
          city: user.city,
          state: user.state, 
          is_type: user.is_type
        }
      else
        render json: { status: 401 }
      end
    end
  
    def logged_in
      if @current_user
        render json: {
          logged_in: true,
          user: @current_user
        }
      else
        render json: {
          logged_in: false
        }
      end
    end
  
    def logout
      reset_session
      render json: { status: 200, logged_out: true }
    end

  end