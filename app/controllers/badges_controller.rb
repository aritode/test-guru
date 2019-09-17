class BadgesController < ApplicationController

  def index
    @badges = Badge.all
  end

  def show
    @badges = current_user.badges
  end

end
