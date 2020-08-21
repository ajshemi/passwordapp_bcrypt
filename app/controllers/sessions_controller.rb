class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

  def new
    @errors = flash[:errors]
    # render :new
  end

  def create
    # find the user instance
    user = Eater.find_by(username: params[:session][:username])
    # use .authenicate to check their plaintext password against the encrypted password
    if user && user.authenticate(params[:session][:password])
      # save their id to session[:eater_id]
      session[:eater_id] = user.id
      redirect_to foods_path
    else
      flash[:errors] = ["Invalid username or password"]
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:eater_id)
    # session[:eater_id]=nil
    redirect_to login_path
  end

end
