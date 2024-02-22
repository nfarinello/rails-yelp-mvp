class ReviewsController < ApplicationController
  # before_action :set_review, only: [:show, :new, :create]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def set_review
  #   @review = Review.find(params[:id])
  # end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
