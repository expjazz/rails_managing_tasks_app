class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name profile global_entity])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile global_entity])
  end

  def tos_global_id(arr)
    arr[1].to_global_id
  end
end
