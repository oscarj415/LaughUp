class UsersController < ApplicationController
  def index_venues
    @venues = User.venue

    # The `geocoded` scope filters only flats with coordinates
    @markers = @venues.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end
  def index_comedians
    @comedians
  end

  def show
  end
end
