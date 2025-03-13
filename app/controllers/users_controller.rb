class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index_comedians, :index_venues, :show]

  def index_venues
    @venues = User.venue

    # The `geocoded` scope filters only flats with coordinates
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude
      }
    end
  end

  def index_comedians
    @comedians = User.comedian
  end

  def show
    set_user
    # @events = @user.events_as_comedian
    # @events = @user.events_as_venue
    @previous_event = Event.find(params[:previous_event_id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:xxx, :yyy)
  end
end
