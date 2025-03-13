class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    set_event
    @comedian = @event.comedian
    @venue = @event.venue
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_event
  end

  def update
    if @event.update(events_params)
      redirect_to events_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def events_params
    params.require(:event).permit(:xxx, :yyy)
  end
end
