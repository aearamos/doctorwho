class DoctormatchesController < ApplicationController

  def index
    @doctor = Doctor.find(params[:id])
  end

  def status
    @doctor = Doctor.find(params[:id])
    current_user.doctorstatus = "pendding"
    current_user.save
    @doctor.user_id = current_user.id
    @doctor.save
    redirect_to doctor_path
    flash[:notice] = "We'll Contact you to verify your information shortly " + @doctor.name
  end

end


