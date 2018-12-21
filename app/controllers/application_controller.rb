class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hello, #{current_user.full_name}!"
    if resource.admin?
      admin_tests_path
    else
      super
    end
  end

end
