class DoctorsController < ApplicationController

  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @search = Search.new(search_params)
    @reviews = Review.all
    @doctors = Doctor.all


    if params[:search]
      if params[:search][:name]
        @name = params[:search][:name]
        @doctors_name = @doctors.where("name ILIKE  ?", "%#{@name}%")
      end
      if params[:search][:rating]
        @rating = params[:search][:rating]
        @rating = @rating.to_f
        @doctors_rating = Doctor.min_average(@rating)
      end
      if params[:search][:specialty]
        @specialty = params[:search][:specialty]
        @s = Specialty.find_by name: (@specialty)
        @doctors_specialty = Doctor.doctor_specialty(@s)
      end
      @doctors = @doctors_rating & @doctors_name & @doctors_specialty
    end
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
    @review = Review.new

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

  def search_params
    params.require(:search).permit(:first_name) if params[:search]
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

end
