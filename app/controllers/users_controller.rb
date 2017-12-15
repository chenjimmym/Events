class UsersController < ApplicationController

    skip_before_action :require_login, only: [:index, :create]

    def index
        puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        render "index"
    end
    def create
        puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        @user = User.new(user_params)
        if @user.save
            redirect_to "/"
        else
            puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$"
            flash[:errors] = @user.errors.full_messages
            redirect_to "/"
        end
    end
    def edit
        render 'edit'
    end
    def update
        # current_user.update(user_params)
        @user = current_user
        if @user.update(user_params)
            redirect_to "/events"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/edit"
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end
end
