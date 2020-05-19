class ApplicationController < ActionController::Base

  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  # @param [User] user
  def login(user)
    session[:token] = user.new_session!
  end

  def logout
    current_user.new_session!
    session[:token] = nil
    @current_user = nil
  end

  def logged_in?
    current_user != nil
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

end
