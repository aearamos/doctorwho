class DoctormatchesController < ApplicationController

  def index
    @doctor = Doctor.find(params[:id])
  end

  def status
    puts "ITS WORKING"
    redirect_to doctors_path
  end

end
