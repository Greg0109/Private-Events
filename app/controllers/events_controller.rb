class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
        user_id = @event.user_id
        @user = User.where("id='#{user_id}'").take
        @attendees = Atendee.where("event_id='#{@event.id}'")
        @names = Array.new
        @attendees.each do |x|
            username = User.where("id='#{x.user_id}'")
            username = username.collect(&:username)
            @names.push(username[0])
        end
    end
    
    def new
        @event = Event.new
    end

    def create
        user_id = session[:userid]
        @user = User.where("id='#{user_id}'").take
        @event = @user.events.build(event_params.merge(user_id: user_id))
        if @event.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def attend
        if logged_in?
            event = params[:event_id]
            userid = session[:userid]
            @atendee = Atendee.new(:user_id => userid, :event_id => event)
            if @atendee.save
                redirect_to "/events/show/#{event}"
            else
                redirect_to root_path
            end
        end
    end

    private
    def event_params
        params.require(:event).permit(:title,:description,:date)
    end
end
