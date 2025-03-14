class ReviewsController < ApplicationController
  before_action :set_event
  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @reviews = @event.reviews
  end

  def create
    @review = @event.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to event_path(@event), notice: "Review was successfully created."
    else
      flash.now[:alert] = "There was an error creating the review."
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to event_path(@event), notice: "Review was successfully updated."
    else
      flash.now[:alert] = "There was an error updating the review."
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to event_path(@event), notice: "Review was successfully deleted."
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_review
    @review = @event.reviews.find(params[:id])
  end

  def review_params
    params.permit(:rating, :content, :user_type, :reviewed_id)
  end
end
