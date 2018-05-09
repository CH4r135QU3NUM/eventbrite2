class EventsController < ApplicationController
  

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
    @event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end





  def suscribe
    @event = Event.find(params[:id])
    if 
    @event.event_attendees.include? current_user.id
    flash[:error] = "Tu participes déjà à l'événement !" 
    redirect_to @event
    else
    @event.event_attendees << current_user.id
    flash[:success] = "Tu participes à l'événement !" 
    redirect_to @event
    end

    private
  	def event_params
      params.permit(:price, :description, :date, :place)
  	end
  end
end