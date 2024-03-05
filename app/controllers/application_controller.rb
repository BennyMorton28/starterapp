class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_user
    unless current_user
      flash[:alert] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end
end
