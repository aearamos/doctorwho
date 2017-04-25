class DoctorsController < ApplicationController

  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(cocktail_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = doctor.find(params[:id])
    @doctor.update(doctor_params)
    redirect_to doctor_path(@cocktail)

  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to doctors_path
  end


private


  def doctor_params
    params.require(:doctor).permit(:name, :photo, :photo_cache)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

end
