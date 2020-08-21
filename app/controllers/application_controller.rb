class ApplicationController < ActionController::Base
    before_action :current_user
    before_action :authorized
    
    private 
    def authorized
      if @logged_in_eater
        # just continue with the request
      else
        redirect_to login_path
      end
    end
  
    def current_user
      @logged_in_eater = Eater.find_by(id: session[:eater_id])
    end
  
end
