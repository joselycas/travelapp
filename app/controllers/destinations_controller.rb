
class DestinationsController < ApplicationController

  def index
    @user = current_user
    @destinations = Destination.all
    # if params[:club_id]
    #     @fighters = Club.find(params[:club_id]).includes(:clubs).fighters
    # else
    #     @fighters = Fighter.all
    # end
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.build
    2.times { @destination.activities.build }
  end

  def create
      if logged_in? && current_user
      @trip = Trip.find(params[:trip_id])
      @destination = Destination.create(destination_params)

        if @destination.save
          redirect_to trip_destination_path(@trip, @destination)
        else
          render :new
        end
      flash[:notice] = "You don't have access!"
    end
  end

  def show
    @destination = Destination.find(params[:id])
    @trip_id = params[:trip_id]
    @user = current_user
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
    params.require(:destination).permit(:country, :state, :trip_id, addresses_attributes: [:id, :name])
  end
end
