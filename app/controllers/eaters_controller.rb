class EatersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def new
        @eater=Eater.new
        @errors = flash[:errors]
    end

    def create
        user=Eater.create(user_params)
        if user.errors.present?
            flash[:errors] = user.errors.full_messages
            redirect_to signup_path
        else 
            #save the id the session automatically login when new eater is creater
            session[:eater_id]=user.id
            redirect_to foods_path
        end
    end

    private 
    def user_params
        params.require(:eater).permit(:username,:password,:password_confirmation)
    end

end
