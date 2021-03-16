class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
        # @attendees = @event.attendees
    end
    
    def new
        @event = Event.new
        @user = current_user
    end

    def create
        @event = Event.new(event_params)
        @user = current_user
        if @event.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
    def event_params
        params.require(:event).permit(:title,:description,:date)
    end
end
