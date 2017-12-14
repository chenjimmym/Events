class EventsController < ApplicationController
    def index
        @current_user = current_user
        @events = Event.all
        puts '##################', @events
        render 'index'
    end
    def create
        @event = Event.new(event_params)
        @event.user = current_user
        if @event.save
            redirect_to '/events'
        else
            flash[:errors] = "Unable to create the Event"
            redirect_to '/events'
        end
        # puts '##############'
        # puts @event.inspect
        # puts current_user.inspect
    end

    private
    def event_params
        params.require(:event).permit(:name, :date, :city, :state)
    end


end
