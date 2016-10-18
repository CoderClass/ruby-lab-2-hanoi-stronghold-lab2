class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:email]
    raise 'aa' 
    if @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      flash[:succes] = 'Login successfully'
      redirect_to users_path
    else
      flash[:error] = 'User or password is not correct'
      redirect_to login_path
    end 

  end
end
