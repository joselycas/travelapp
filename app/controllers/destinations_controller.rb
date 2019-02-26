
class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.create(destination_params)
    if @destination.save
      redirect_to destination_path(@destination)
    else
      render :new
    end
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def destination_params
    params.require(:destination).permit(:country, :state)
  end
end
