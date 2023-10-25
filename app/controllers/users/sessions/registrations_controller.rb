class Users::Sessions::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def after_confirmation_path_for(resource_name, resource)
 
    user_path(resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
  end
end
