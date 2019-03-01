class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
   if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
     # Log the user in and redirect to the user's show page.

   else
     flash[:danger] = 'Invalid email/password combination' # Not quite right!
     render 'new'
   end

    # @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #   u.name = auth['info']['name']
    #   u.email = auth['info']['email']
    #   u.image = auth['info']['image']
    # end
    # session[:user_id] = @user.id
    # render 'users/new'
  end

  def destroy
     User.find(session[:user_id]).destroy
     session[:user_id] = nil
     redirect_to root_path
   end
  private

  def auth
    request.env['omniauth.auth']
  end
end
