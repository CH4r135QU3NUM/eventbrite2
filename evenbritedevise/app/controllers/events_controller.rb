class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def show
  end

  def new
  	@event = Event.new
  end
end


def create
  	@event = Event.new(event_params)
  	@event.creator = current_user
  	if @event.save
  		redirect_to @event
  	else render 'new'
  	end
  end

  