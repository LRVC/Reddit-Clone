class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end

  def check_user
    redirect_to root_path, notice: 'You must be logged in to do that' unless current_user
  end

end
