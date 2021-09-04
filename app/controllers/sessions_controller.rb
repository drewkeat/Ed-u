class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:home]
  def home
  end

  def create
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Logged in as #{@user.name}."
      redirect_to @user
    else
      flash[:danger] = "Login not found."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out."
    redirect_to root_path
  end

end
