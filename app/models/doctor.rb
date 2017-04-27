class Doctor < ApplicationRecord

  belongs_to :user, optional: true
  has_many :reviews
  has_many :treatmentspecialties
  has_many :specialties, through: :treatmentspecialties

  def average_review
    if self.reviews.size > 0
      self.reviews.average(:rating)
    else
      0
    end
  end

  # def self.min_average(min_value)
  #   @docs = []
  #   @doctors.each do |doctor|
  #   if average_review >= min_value
  #     @docs << doctor
  #   end
  #   return @docs
  #   end
  # end


    def self.min_average(min_value)
      @docs = Doctor.all
      @docs.select do |doctor|
        doctor.average_review >= min_value
      end
    end

end








