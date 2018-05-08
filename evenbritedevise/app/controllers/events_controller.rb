class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

def create

	@event = Event.new
  	@event.date = params[:date]
		@event.description = params[:description]
		@event.place = params[:place]
		@event.creator_id = current_user.id
		@event.price = params[:price].to_f / 100
		@event.creator = current_user
  	if @event.save
  	flash[:success] = "Votre événement a bien été créé !"    
  		redirect_to @event
  	else render 'new'
  	end
  end

  def show
  end

  def new
  	@event = Event.new
  end
end




  def suscribe
    @event = Event.find(params[:id])
    if 
    @event.attendees.include? current_user
    flash[:error] = "Tu participes déjà à l'événement !" 
    redirect_to @event
    else
    @event.attendees << current_user
    flash[:success] = "Tu participes à l'événement !" 
    redirect_to @event
    end

    private
  	def event_params
      params.permit(:name, :description, :date, :place)
  	end
  end