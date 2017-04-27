class Specialty < ApplicationRecord

  has_many :treatmentspecialties
  has_many :doctors, through: :treatmentspecialties


  def self.all_specialties
    @specialties = Specialty.all
    @specialty_names = []
    @specialties.each do |specialty|
      @specialty_names << specialty.name
    end
    return @specialty_names
  end



end
