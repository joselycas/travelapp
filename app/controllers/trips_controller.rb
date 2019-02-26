class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @user = current_user
    @trip = current_user.trips.build
  end

  def create
    @user = current_user
    @trip = Trip.create(trip_params)
     if @trip.save
        redirect_to user_trip_path(@user, @trip)
      else
        render :new
      end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  private

  def trip_params
    params.require(:trip).permit(:description, :budget, :start_date, :end_date, :user_id)
  end
end
