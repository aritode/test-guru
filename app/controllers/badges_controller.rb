class BadgesController < ApplicationController

  def index
    @badges = Badge.all
  end

  def collected
    @badges = current_user.badges
  end

end
