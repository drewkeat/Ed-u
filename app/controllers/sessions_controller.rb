class SessionsController < ApplicationController
  def home
  end

  def create
    @user = User.find_by(email: params[:user_id])
  end

  def destroy
  end
end
