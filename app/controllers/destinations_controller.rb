
class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def create
      if logged_in? && current_user
      @destination = Destination.create(destination_params)
        if @destination.save
          redirect_to destination_path(@destination)
        else
          render :new
        end
      flash[:notice] = "You don't have access!"
    end
  end

  def show
    @destination = Destination.find(params[:id])
    @user = current_user
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    if @destination.save
      redirect_to destination_path(@destination)
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
    params.require(:destination).permit(:country, :state)
  end
end
