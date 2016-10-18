class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:email]
    if @user
      if @user.authenticate(params[:password]) 
        session[:user_id] = @user.id
        flash[:success] = 'Login successfully'
        redirect_to users_path
      else
        flash[:error] = 'Password is not correct'
        redirect_to login_path
      end 
    else
      flash[:error] = 'User not found'
      redirect_to login_path 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
