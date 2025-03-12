class InterestsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @interest = Interest.create(user: current_user, event: @event)
  end

  def delete
  end

end
