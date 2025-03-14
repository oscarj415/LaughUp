class InterestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @interest = @event.interests.find_or_initialize_by(user: current_user)

    if @interest.persisted?
      @interest.destroy
    else
      @interest.save
    end

    redirect_to event_path(@event)
  end
end
