class Review < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  after_create :calculate_doctor_average_review


    private

    def calculate_doctor_average_review
      doctor = self.doctor
      doctor.average_rating = doctor.reviews.average(:rating).to_f
      doctor.save
    end
end
