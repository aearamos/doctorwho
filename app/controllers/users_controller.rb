class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @doctor = @user.doctor
  end
end
