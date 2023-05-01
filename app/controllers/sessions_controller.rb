class SessionsController < ApplicationController

    def new
    end

    def create
       user=User.find_by(email:params[:session][:email].downcase)
       puts "User found: #{user.inspect}"
       if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice]= "Logged in successfully."
        redirect_to user_path(user)
      else
      
        # If authentication fails, show an error message and re-render the login form
        flash.now[:alert] = "Invalid email/password combination."
        render "new"
      end 
    end

    def destroy
        session[:user_id] = nil
        flash[:notice]="Logged Out"
        redirect_to root_path
    end
end