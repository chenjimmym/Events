class EventsController < ApplicationController
    def index
        @current_user = current_user
        @events_in_state = Event.where(state: @current_user.state)
        @events_out_state = Event.where.not(state: @current_user.state)
        render 'index'
    end
    def create
        @event = Event.new(event_params)
        @event.user = current_user
        if @event.save
            redirect_to '/events'
        else
            flash[:errors] = @event.errors.full_messages
            redirect_to '/events'
        end
    end
    def destroy
        Event.find(params[:event]).destroy
        redirect_to '/events'
    end
    def show
        @event = Event.find(params[:id])
        render 'show'
    end
    def join
        @attend = Attend.new(user: current_user, event: Event.find(params[:event]))
        puts '##################', @attend.inspect
        @attend.save
        redirect_to '/events'
    end

    private
    def event_params
        params.require(:event).permit(:name, :date, :city, :state)
    end


end
