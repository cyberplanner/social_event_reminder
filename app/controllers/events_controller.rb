class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      flash[:success] = "Successfully created the event"
      redirect_to @event
    else
      flash[:alert] = "Something went wrong"
      render :new
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
      if @event.save
        flash[:success] = "Successfully edited the event"
      redirect_to @event
      else
        flash[:alert] = "You messed up!"
        render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date)
  end



end
