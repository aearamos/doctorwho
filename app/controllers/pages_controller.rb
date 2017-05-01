class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @reviews_first = Review.first
    @reviews_second = Review.second
    @reviews_third = Review.third
  end
end


