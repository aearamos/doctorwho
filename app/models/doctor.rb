class Doctor < ApplicationRecord
  belongs_to :user, optional:true
  has_many :reviews
  has_many :treatmentspecialties
  has_many :specialties, through: :treatmentspecialties

  def average_review
    if self.reviews.size > 0
        self.reviews.average(:Rating)
    else
        "-"
    end
  end

end



