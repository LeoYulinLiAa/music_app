class SessionController < ApplicationController

  before_action :require_logged_in, only: :destroy

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credential(params[:user][:email], params[:user][:password])
    if user
      login(user)
      redirect_to user_url(user)
    else
      flash[:error] = "Invalid email or password"
      redirect_to new_session_url
    end
  end

  def destroy
    logout
  end

end
