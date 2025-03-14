class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @events = Event.all
    @venues = User.venue

    # The `geocoded` scope filters only flats with coordinates
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window_html: render_to_string(partial: "users/info_window", locals: {venue: venue})
      }
    end
  end

  def show
    set_event
    @comedian = @event.comedian
    @venue = @event.venue
    @markers =
        [{
          lat: @venue.latitude,
          lng: @venue.longitude,
          info_window_html: render_to_string(partial: "users/info_window", locals: {venue: @venue})
          }]
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

  # def venue_index
  #   redirect_to home_path unless current_user.comedian?
  # end


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
