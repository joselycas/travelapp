class TripsController < ApplicationController

  def index
    @user = current_user
    @trips = current_user.trips
  end

  def new
    @user = current_user
    @trip = current_user.trips.build
    #@destination = Destination.find(params[:id])
  end

  def create
    @user = current_user
    @trip = Trip.new(trip_params)
     if @trip.save
        redirect_to trip_path(@trip)
      else
      
        render :new
      end
  end

  def show
    @user = current_user
    @trip = Trip.find(params[:id])
  end

  def edit
    @user = current_user
    @trip = Trip.find(params[:id])
  end

  def update
    @user = current_user
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    Trip.find(params[:id]).destroy
    flash[:notice] = "Success You've deleted this trip!"
    redirect_to trips_path(@trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:description, :budget, :start_date, :end_date, :user_id, :activity_ids => [], :destination_ids => [])
  end
end
