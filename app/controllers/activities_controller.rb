class ActivitiesController < ApplicationController

  def index
    @user = current_user
    @trip = Trip.find_by(params[:id])
    @destination = Destination.find_by(params[:id])
    @activities = Activity.all
  end

  def new
    @destination_id = params[:destination_id]
    @trip_id = params[:trip_id]
    @activity = Activity.new

  end

  def create
      if logged_in? && current_user
        @destination = Destination.find_by(params[:id])
        @trip = Trip.find_by(params[:id])
        @activity = Activity.create(activity_params)
        if @activity.save
          redirect_to activity_path(@activity)
        else
          flash[:error] = "Please make sure you fill in all fields"
          render :new

        end
      else
        flash[:notice] = "You don't have access!"
     end
  end

  def show
    @user = current_user
    @activity = Activity.find(params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    Activity.find(params[:id]).destroy
    redirect_to user_trips_path(@user)
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :destination_id, :trip_id)
  end
end
