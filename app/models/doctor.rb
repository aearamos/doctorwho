class Doctor < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  has_many :treatmentspecialties
  has_many :specialties, through: :treatmentspecialties

end



