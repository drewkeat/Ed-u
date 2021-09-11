class UsersController < ApplicationController
  before_action :verify_access, except: [:new, :create]
  before_action :redirect_if_logged_in, only: [:new]
    
    def index
      if request.path == '/admin/users' && admin?
        @users = current_user.subordinates
      else
        @users = User.all
      end
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          session[:user_id] = @user.id
          redirect_to @user
        else
          flash[:danger] = "Please correct the field(s) below."
          render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
        if @user == current_user || admin?
          render 'show'
        else
          flash[:danger] = "You cannot view another user's profile."
          redirect_to current_user
        end
    end

    def edit
        @user = User.find(params[:id])
        if admin? || @user == current_user
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
        params.require(:user).permit(:name, :email, :password, :department_id, :supervisor_id, :access)
    end

end
