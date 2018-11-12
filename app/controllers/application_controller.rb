class ApplicationController < ActionController::Base
  helper_method :current_year

  def current_year
    Date.today.year
  end
end
