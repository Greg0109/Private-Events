class UsersController < ApplicationController
    def index
        @users = User.all
    end

    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                session[:userid] = @user.id
                session[:username] = @user.username
                format.html { redirect_to root_path, notice: 'User created successfully' }
                format.json { render :index, status: :created, location: root_path}
            else
                format.html { redirect_to users_new_path, notice: 'Error while creating user' }
                format.json { render 'new', location: users_new_path }
            end
        end
    end
    
    def show
        if logged_in?
            @user = User.find(params[:id])
            @event = Event.where("user_id='#{@user.id}'")
            @past_events = @event.past
            @upcoming_events = @event.upcoming
        else
            redirect_to users_new_path
        end
    end

    def log_in
    end

    def log_in_user
        @user = User.where("username='#{params[:username]}'").take
        if @user.nil?
            respond_to do |format|
                format.html { redirect_to users_log_in_path, notice: 'Failed to login.' }
                format.json { render :sign_in, location: users_log_in_path}
            end
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
