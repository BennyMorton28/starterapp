class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(username: params[:username])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You are now logged-in."
      redirect_to blackjack_path
    else
      flash.now[:alert] = "Sorry, invalid username or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye."
    redirect_to login_path
  end
end
