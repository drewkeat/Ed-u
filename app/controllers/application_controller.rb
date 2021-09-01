class ApplicationController < ActionController::Base

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by(session[:user_id])
    end

end
