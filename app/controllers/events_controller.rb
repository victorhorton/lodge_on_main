class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:success] = "Event Saved"
      redirect_to events_path
    else
      flash.now[:warn] = "Event didn't save"
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
