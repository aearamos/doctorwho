class DoctormatchesController < ApplicationController

  def index
    @doctor = Doctor.find(params[:id])
  end

end
