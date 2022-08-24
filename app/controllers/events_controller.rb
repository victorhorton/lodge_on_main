class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Event Updated"
      redirect_to events_path
    else
      flash.now[:warn] = "Updated Failed"
      render :new 
    end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:success] = "Event Saved"
      redirect_to events_path
    else
      flash.now[:warn] = "Save failed"
      render :new 
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(
      :title, 
      :description, 
      :date, 
      :start_time, 
      :end_time
    )
  end
end
