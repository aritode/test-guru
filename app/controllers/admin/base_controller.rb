class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    unless current_user.admin?
      redirect_to root_path, alert: t('devise.failure.you_are_not_authorized')
    end
  end

end
