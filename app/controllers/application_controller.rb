class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_logged_in
      if logged_in?
        redirect_to user_path(current_user)
      end
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def verify_access
      if !logged_in? 
        flash[:danger] = "You must be logged in."
        redirect_to root_path
      end
    end

end
