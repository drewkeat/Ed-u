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

  def omniauth
    user = User.find_or_create_by(uid: omniauth_hash[:uid], provider: omniauth_hash[:provider]) do |u|
      u.name = omniauth_hash[:info][:name]
      u.email = omniauth_hash[:info][:email]
      u.password = SecureRandom.hex(16)
    end
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:danger] = "Incorrect Login"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out."
    redirect_to root_path
  end

  private

  def omniauth_hash
    request.env['omniauth.auth']
  end
end
