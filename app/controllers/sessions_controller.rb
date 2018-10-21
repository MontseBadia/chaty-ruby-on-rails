class SessionsController < ApplicationController
  def new
    unless logged_in?
      @user = User.new
    end
  end

  def create
    @user = User.find_by(username: login_params[:username])
    
    if @user&.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else 
      flash.now[:notice] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
