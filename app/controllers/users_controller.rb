class UsersController < ApplicationController

    skip_before_action :require_login, only: [:index]

    def index
        render "index"
    end
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to "/"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/"
        end
    end
    def edit
        render 'edit'
    end
    def update
        current_user.update(user_params)
        if current_user.save
            redirect_to "/events"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/events"
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end
end
