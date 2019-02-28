class TripsController < ApplicationController

  def index
    @trips = Trip.all
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
        redirect_to user_trip_path(@user, @trip)
      else
        render :new
      end
  end

  def show
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
      redirect_to user_trip_path(@user, @trip)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    Trip.find(params[:id]).destroy
    redirect_to user_trip_path(@user)
  end

  private

  def trip_params
    params.require(:trip).permit(:description, :budget, :start_date, :end_date, :user_id, :activity_ids => [], :destination_ids => [])
  end
end
