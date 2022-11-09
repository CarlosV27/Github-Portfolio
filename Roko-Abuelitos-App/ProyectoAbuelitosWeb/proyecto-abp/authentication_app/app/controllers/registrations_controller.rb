class RegistrationsController < ApplicationController
    def create
      user = User.create!(
        email: params['user']['email'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation'],
        name: params['user']['name'],
        age: params['user']['age'],
        gender: params['user']['gender'], 
        city: params['user']['city'],
        state: params['user']['state'],
        is_type: params['user']['is_type'],
      )
  
      if user
        session[:user_id] = user.id
        render json: {
          status: :created,
          user: user,
          name: user.name,
          age: user.age,
          gender: user.gender,
          city: user.city,
          state: user.state, 
          is_type: user.is_type     
        }
      else
        render json: { status: 500 }
      end
    end
  end