class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @doctor = Doctor.find(params[:doctor_id])
    @review.doctor = @doctor
    @review.save

    redirect_to doctor_path(@doctor)
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def review_params
    params.require(:review).permit(:title, :comment, :rating)
  end
end


