class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Login was successful"
      redirect_to user
    else
      flash[:notice] = "Login Error"
      redirect_to root_path
    end
  end

  def destroy 
    session[:user_id] = nil
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end

end