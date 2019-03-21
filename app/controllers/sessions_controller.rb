class SessionsController < ApplicationController
skip_before_action :require_login
  def new
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      oath_email = request.env['omniauth.auth']['info']['email']
      oath_name = request.env['omniauth.auth']['info']['name']
      if user = User.find_by(:email => oath_email, :name => oath_name)
      session[:user_id] = user.id
      redirect_to user_path(user.id)
      else
        user = User.new(:name => oath_name, :email => oath_email, :password => SecureRandom.hex)
          if user.save
            session[:user_id] = user.id
          else
            raise user.errors.full_messages.inspect
          end
        end
          else
            user = User.find_by(email: params[:session][:email])
              if user && user.authenticate(params[:session][:password])
                session[:user_id] = user.id
                redirect_to user_path(user), notice: "You've successfully logged in!"
              else
                flash.now[:alert] = "Email or password is invalid"
                render "new"
              end
      end
  end


  def destroy
    #session.delete :name
     #User.find(session[:user_id]).destroy
     #flash[:success] = "You've logged out"
     session[:user_id] = nil
     redirect_to root_path, notice: "You've successfully logged out!"
   end

end
