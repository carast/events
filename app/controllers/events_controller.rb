class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    @event.identity = current_identity

    if @event.save
      redirect_to root_url, notice: t('.success')
    else
      render :new
    end
  end

private
  def event_params
    params.require(:event).permit :name, :description, :start_date, :end_date, :location, :organizer
  end
end
