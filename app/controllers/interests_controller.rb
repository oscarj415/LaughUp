class InterestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @interest = @event.interests.find_or_initialize_by(user: current_user)

    if @interest.persisted?
      @interest.destroy
      status = "canceled"
    else
      @interest.save
      status = "interested"
    end

    render json: { status: status, count: @event.interests.count } # return json with status: and count:
  end
end
