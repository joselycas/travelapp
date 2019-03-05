class SessionsController < ApplicationController

  def new
  end

  def create
    # if request.env[‘omniauth.auth’]
    #   user = User.create_with_omniauth(request.env[‘omniauth.auth’])
    #   session[:user_id] = user.id
    #   redirect_to user_path(user.id)
    # else
      @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "Logged in!"
        else
          flash.now[:alert] = "Email or password is invalid"
          render "new"
        end
    # end
  end
  # def create
  #   if auth
  #    @user = User.find_or_create_by(uid: auth['uid']) do |u|
  #      u.name = auth['info']['name']
  #      u.email = auth['info']['email']
  #      u.image = auth['info']['image']
  #    end
  #    session[:user_id] = @user.id
  #    redirect_to user_path(@user)
  #   else
  #     @user = User.find_by(email: params[:session][:email])
  #       if @user && @user.authenticate(params[:session][:password])
  #         session[:user_id] = @user.id
  #         redirect_to user_path(@user), notice: "Logged in!"
  #       else
  #         flash.now[:alert] = "Email or password is invalid"
  #         render "new"
  #       end
  #   end
  # end

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
