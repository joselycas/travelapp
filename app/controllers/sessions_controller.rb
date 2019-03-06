class SessionsController < ApplicationController

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
                redirect_to user_path(user), notice: "Logged in!"
              else
                flash.now[:alert] = "Email or password is invalid"
                render "new"
              end
        end
    end


  def destroy
     User.find(session[:user_id]).destroy
     session[:user_id] = nil
     redirect_to root_path
   end

end
