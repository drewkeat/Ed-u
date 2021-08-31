class UsersController < ApplicationController
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
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :department_id, :supervisor_id, department_attributes:[:name])
    end
end
