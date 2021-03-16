class UsersController < ApplicationController
    def index
        @users = User.all
    end

    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:userid] = @user.id
            session[:username] = @user.username
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def show
        if logged_in?
            @user = User.find(params[:id])
            @events = Event.where("user_id='#{@user.id}'")
        else
            redirect_to users_new_path
        end
    end

    def log_in
    end

    def log_in_user
        @user = User.where("username='#{params[:username]}'").take
        if @user.nil?
            render :sign_in
        else
            session[:userid] = @user.id
            session[:username] = @user.username
            redirect_to root_path
        end
    end

    def log_out
        reset_session
        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end
