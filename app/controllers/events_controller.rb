class EventsController < ApplicationController
  def index
    @event = Event.all
    @past_events = @event.past
    @upcoming_events = @event.upcoming
  end

  def show
    @event = Event.find(params[:id])
    user_id = @event.user_id
    @user = User.where("id='#{user_id}'").take
    @attendees = Atendee.where("event_id='#{@event.id}'")
    @names = []
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
    if logged_in?
      user_id = session[:userid]
      @user = User.where("id='#{user_id}'").take
      @event = @user.events.build(event_params.merge(user_id: user_id))
      respond_to do |format|
        if @event.save
          format.html { redirect_to root_path, notice: 'Event created successfully' }
          format.json { render :index, status: :created, location: root_path }
        else
          format.html { redirect_to '/events/new', notice: 'Error while creating event' }
          format.json { render 'new', location: events_new_path }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Must be logged in to make a new event' }
        format.json { render :index, status: :created, location: root_path }
      end
    end
  end

  def attend
    if logged_in?
      event = params[:event_id]
      userid = session[:userid]
      @atendee = Atendee.new(user_id: userid, event_id: event)
      if @atendee.save
        redirect_to "/events/show/#{event}"
      else
        redirect_to root_path
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You must be logged in to attend an event' }
        format.json { render :index, location: root_path }
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
