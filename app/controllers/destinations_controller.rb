
class DestinationsController < ApplicationController

  def top
    @top_destinations = Trip.top_n_destinations(5)
  end


  def index
    @trip_id = Trip.find(params[:trip_id])
    @destinations =  @trip_id.destinations
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.build
  end

  def create
    @user = current_user
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.find_or_create_by(country: params[:destination][:country])
    @destination.update(destination_params)
      if @destination.save
        redirect_to trip_destination_path(@trip, @destination)
      else
        render :new
      end
    end

  def show
    @user = current_user
    @destination = Destination.find(params[:id])
    @destination_id = params[:id]
    @trip_id = params[:trip_id]
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    if @destination.save
      redirect_to trip_destination_path(@destination)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    Destination.find(params[:id]).destroy
    redirect_to user_trips_path(@user)
  end

  private
  def destination_params
    params.require(:destination).permit(:country, :state, trip_destinations_attributes: [:cost, :trip_id])
  end
end
