class Doctor < ApplicationRecord
  belongs_to :user
  has_many :treatmentspecialties
  has_many :specialties, through: :treatmentspecialties

end



