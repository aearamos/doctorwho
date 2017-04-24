class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :review
  has_many :treatmentspecialties
  has_many :specialties, through: :treatmentspecialties

end



