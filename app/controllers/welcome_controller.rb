class WelcomeController < ApplicationController
  skip_before_action :require_login
  def home
    #this should be the users homepage when logged in. The view is in the users/show page
  end
end
