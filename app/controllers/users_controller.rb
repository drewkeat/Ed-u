class UsersController < ApplicationController
  before_action :verify_access, except: [:new]
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
        @user.department = Department.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          session[:user_id] = @user.id
          redirect_to @user
        else
          flash[:danger] = "Something went wrong"
          render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
        if @user == current_user
          render 'edit'
        else
          flash[:danger] = "You cannot edit another user's profile."
          redirect_to @user
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:success] = "User was successfully updated"
          redirect_to @user
        else
          flash[:danger] = "Something went wrong"
          render 'edit'
        end
    end
    
    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = 'User was successfully deleted.'
        redirect_to users_url
      else
        flash[:warning] = 'Something went wrong'
        redirect_to users_url
      end
    end
    
    
    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :department_id, :supervisor_id, department_attributes:[:name])
    end
end
