class ApplicationController < ActionController::Base
  before_action :require_login
  private

  def current_user
  if session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
 end

def logged_in?
    !!current_user
end

  def require_login
    if !logged_in?
       flash[:error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end

end
