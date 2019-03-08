
class DestinationsController < ApplicationController

  def index
    @trip_id = Trip.find(params[:trip_id])
    @destinations =  @trip_id.destinations
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.build
  end

  def create
      if logged_in? && current_user
        @user = current_user
        @trip = Trip.find(params[:trip_id])
        @destination = Destination.create(destination_params)
          if @destination.save
            redirect_to trip_destination_path(@trip, @destination)
          else
            flash[:notice] = "You don't have access!"
            render :new
          end
        end
    end

  def show
    if logged_in? && current_user
      @user = current_user
      @destination = Destination.find(params[:id])
      @destination_id = params[:id]
      @trip_id = params[:trip_id]
    else
      redirect_to root_path
    end
  end

  def edit
    if logged_in? && current_user
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.find(params[:id])
  else
    redirect_to root_path
  end
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
    params.require(:destination).permit(:country, :state, trip_destinations_attributes: [:id, :cost])
  end
end
