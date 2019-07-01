class UsersController < ApplicationController
  skip_before_action :require_login

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Travel App!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
     else
       @errors = @user.errors.full_messages
       render :new
     end
  end

  def show
    @user = User.find(params[:id])
    @trips = current_user.trips
  end

  def edit
  end

  def update
  end

  def destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    flash[:success] = "You've successfully logged out"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
