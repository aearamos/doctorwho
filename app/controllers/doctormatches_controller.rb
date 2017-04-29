class DoctormatchesController < ApplicationController

  def index
    @doctor = Doctor.find(params[:id])
  end

  def status
    redirect_to doctors_path
    flash[:notice] = "Will cntact you to verify the information shortly..."
  end

end
