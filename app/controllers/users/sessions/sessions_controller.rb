# app/controllers/users/sessions_controller.rb

class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(_resource)
    categories_path
  end
end
