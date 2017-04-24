class Specialty < ApplicationRecord

  has_many :treatmentspecialties
  has_many :doctors, through: :treatmentspecialties

end
