class ActivitiesController < ApplicationController

  def index
    
    #@user = current_user
    @activities = Activity.all

  end

  def new
    @activity = Activity.new
  end

  def create
  if  @user = current_user
    @activity = Activity.create(activity_params)
      if @activity.save
      redirect_to activity_path(@activity)
      else
      flash[:error] = "Please make sure you fill in all fields"
      render :new
      end
    end
  end

  def show
    @user = current_user
    @activity = Activity.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end
end
