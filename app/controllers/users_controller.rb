class UsersController < ApplicationController
  
  before_action :require_logged_in, except: %i[new create show]
  
  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user_url(user)
    else
      flash[:error] = user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def edit
    @user = User.find_by_id(params[:id])
    render :edit
  end

  def update
    user = User.find_by_id(params[:id])
    user.update(user_params)
    if user.save
      redirect_to user_url(user)
    else
      flash[:error] = user.errors.full_messages
      redirect_to edit_user_url(params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
