class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by_username(session_params[:username])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      redirect_to login_path, notice: 'username and password not found'
    end
  end

  def destroy

    session.clear
    redirect_to posts_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
