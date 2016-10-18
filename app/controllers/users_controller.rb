class UsersController < ApplicationController

  def new
    @user = User.new 


  end

  def index
    @users = User.all.shuffle
  end

  def create
    @user = User.new(user_params)
   
    if @user.save
      redirect_to users_path
      session[:user_id] = @user.id
      flash[:success] = 'Logged in'

    else
      flash[:error] = 'Failed to create user'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name) 
  end
end
