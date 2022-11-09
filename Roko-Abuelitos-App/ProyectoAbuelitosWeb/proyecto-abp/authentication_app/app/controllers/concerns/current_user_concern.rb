module CurrentUserConcern
    extend ActiveSupport::Concern # this is a module that allows us to share methods between controllers
  
    included do 
      before_action :set_current_user # this is a method that will be called before any action in the controller    
    end
  
    def set_current_user # this method will set the current user
      if session[:user_id]
        @current_user = User.find(session[:user_id]) # this is an instance variable
      end
    end

  end