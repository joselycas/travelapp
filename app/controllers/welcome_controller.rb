class WelcomeController < ApplicationController
  skip_before_action :require_login

  def home
    @logged_in = logged_in?
  end
end
