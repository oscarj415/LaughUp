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
        info_window_html: render_to_string(partial: "users/info_window", locals: {venue: venue}),
        marker_html: render_to_string(partial: "users/marker")

      }
    end

    if params[:address].present?
      location = Geocoder.search(params[:address]).first

      if location.present?
        latitude = location.latitude
        longitude = location.longitude

        venue_ids = User.venue
                       .with_coordinates
                       .near([latitude, longitude], 2, units: :km)
                       .order(Arel.sql("earth_distance(ll_to_earth(users.latitude, users.longitude), ll_to_earth(#{latitude}, #{longitude})) ASC"))
                       .pluck(:id)

        @events = @events.where(venue_id: venue_ids)
      else
        flash[:alert] = "Could not find the address. Please enter a valid address."
      end
    end


    if params[:date].present?
      begin
        date = Date.parse(params[:date])
        @events = @events.where(date_time: date.beginning_of_day..date.end_of_day)
      rescue ArgumentError
        flash[:alert] = "Invalid date format. Please use YYYY-MM-DD."
      end
    end

    if params[:comedian].present?
      @events = @events.joins(:comedian).where("users.user_name ILIKE ?", "%#{params[:comedian]}%")
    end

    if params[:venue].present?
      @events = @events.joins(:venue).where("users.user_name ILIKE ?", "%#{params[:venue]}%")
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
          info_window_html: render_to_string(partial: "users/info_window", locals: {venue: @venue}),
          marker_html: render_to_string(partial: "users/marker")

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
