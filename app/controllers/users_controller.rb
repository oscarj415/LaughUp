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
    @comedians = User.comedian
  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:xxx, :yyy)
  end
end
