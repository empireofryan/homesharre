class ReviewsController < ApplicationController

  def create
    @review = current_user.review.create(review_params)
    redirect_to @review.room
  end

  def destroy
    @review = Review.find(params[:id])
    room = @review.room
    @review.destory

    redirect_to room
  end

  private
  def review_params
    params.require(:review).permit(:comment, :star, :room_id)
  end
end
