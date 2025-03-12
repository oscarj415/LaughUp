class UsersController < ApplicationController
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
    @event = Event.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:xxx, :yyy)
  end
end
