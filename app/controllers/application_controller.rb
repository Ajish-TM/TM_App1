class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
        !!current_user
    end
    def login_requried
        if !logged_in?
            flash[:alert]="You Must be Logged in to perform that action"
            redirect_to login_path
        end
    end
end
