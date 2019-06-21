class WelcomeController < ApplicationController
  skip_before_action :require_login
  helper_method :current_user, :logged_in?

  def home
    @user = current_user
  end
end
