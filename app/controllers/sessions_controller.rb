class SessionsController < ApplicationController

    skip_before_action :require_login

    def create #login
        # @user = User.find_by_email(params[:email])
        @user = User.find_by(email: params[:email])
        puts '@@@@@@@@@@@@@@@@@@@@@'
        puts @user
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/events'
        else
            flash[:errors] = ["Email and password does not match!"]
            redirect_to '/'
        end
    end

    def destroy #logout
        reset_session
        redirect_to '/'
    end

end
