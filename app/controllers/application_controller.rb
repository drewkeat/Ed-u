class ApplicationController < ActionController::Base
    helper_method [:logged_in?, :current_user, :admin?, :facilitator?, :own?]
    include ApplicationHelper

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

    def admin?
      current_user.access == "admin"
    end

    def facilitator?
        current_user.access == "facilitator"
    end

    def own?(user)
        current_user == user
    end

end
