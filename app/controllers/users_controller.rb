class UsersController < ApplicationController
    def new
        @user=User.new
    end
    def create
        @user=User.new(user_params)
        if @user.save
            flash[:notice]="Welcome to TM Blog #{@user.username},You Successfully Signed Up"
            redirect_to articles_path
        else
            render 'new'
        end
    end
    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
end