class Doctor < ApplicationRecord

  belongs_to :user, optional: true
  has_many :reviews
  has_many :treatmentspecialties
  has_many :specialties, through: :treatmentspecialties
  geocoded_by :street_name
  after_validation :geocode, if: :street_name_changed?

  def average_review
    if self.reviews.size > 0
      self.reviews.average(:rating)
    else
      0
    end
  end

  def self.min_average(min_value)
    @docs = Doctor.all
    @docs.select do |doctor|
      doctor.average_review >= min_value
    end
  end

  def self.doctor_specialty(specialty)
    @docs = Doctor.all
    @docs.select do |doctor|
      doctor.specialties.include?(specialty)
    end
  end



end








