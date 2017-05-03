

class DoctorsController < ApplicationController


  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @search = Search.new(search_params)
    @reviews = Review.all
    @doctors = Doctor.all
    @review = Review.new

    if params[:search] && params[:search][:name].present?
      @name = params[:search][:name]
      @doctors = @doctors.where("name ILIKE  ?", "%#{@name}%")
    end

    if params[:search] && params[:search][:rating].present?
      @rating = params[:search][:rating]
      @doctors = @doctors.where("average_rating > ?", @rating)
    end

    if params[:search] && params[:search][:specialty].present?
      @specialty_params = params[:search][:specialty]
      @doctors = @doctors.joins(:specialties).where(specialties: { name:  params[:search][:specialty]})
    end

     if params[:search] && params[:search][:street_name].present?
      @street = params[:search][:street_name]
      @doctors = @doctors.where("street_name ILIKE  ?", "%#{@street}%")
      #@doctors = Doctor.near([@doctor.latitude, @doctor.longitude], 10)
      # @doctors.each do |doctor|
      #    @doctors = @doctors.near([doctor.latitude, doctor.longitude], 1000)
      # end

    end



    @doctors = Kaminari.paginate_array(@doctors) if @doctors.class == Array
    @doctors = @doctors.page(params[:page]).per(10)
    @doctors= @doctors.order("average_rating DESC")

    @doctors

    @hash = Gmaps4rails.build_markers(@doctors) do |doctor, marker|
      if doctor.latitude.nil? ==true
        doctor.latitude = -23.533773
      end
      if doctor.longitude.nil? == true
        doctor.longitude = -46.65290
      end

      marker.lat doctor.latitude
      marker.lng doctor.longitude

      marker.infowindow "<h5>#{doctor.name}</h5>"
    end
  end


  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
    @review = Review.new
    @doctor_coordinates = { lat: @doctor.latitude, lng: @doctor.longitude }

    @hash = Gmaps4rails.build_markers(@doctor) do |doctor, marker|
      marker.lat doctor.latitude
      marker.lng doctor.longitude


      marker.infowindow "<h5>#{doctor.name}</h5>"


    end
  end

  def edit
    #@doctor = Doctor.find(params[:id])
  end

  def update
    @doctor.update(doctor_params)
    redirect_to doctor_path(@doctor)
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to doctors_path
  end


  private


  def doctor_params
    params.require(:doctor).permit(:photo, :photo_cache, :name, :street_name, :city_name, :phone, :description, :activity, :crm, :insurance, :website)
  end

  def search_params
    params.require(:search).permit(:first_name) if params[:search]
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end


