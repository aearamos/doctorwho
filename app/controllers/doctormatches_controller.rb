class DoctormatchesController < ApplicationController

  def index
    @doctor = Doctor.find(params[:id])
  end

  def status
    @doctor = Doctor.find(params[:id])
    redirect_to doctor_path
    flash[:notice] = "We'll Contact you to verify your information shortly " + @doctor.name
  end

end


