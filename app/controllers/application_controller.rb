class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || posts_path
  end
  protected

      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :username,
                                          :bio, :email, :password, :password_confirmation) }
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username,
                                          :bio, :email, :password, :password_confirmation,
                                            :current_password) }
      end
end
