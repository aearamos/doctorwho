class Review < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  after_create :calculate_doctor_average_review


    private

    def calculate_doctor_average_review
        d = Review.last.doctor
       d.average_rating = d.reviews.average(:rating).to_f
       d.save
    end
end
