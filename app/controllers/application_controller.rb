class ApplicationController < ActionController::Base
  # Skip the default Rails forgery protection
  skip_forgery_protection
  # Rescue from a Pundit::NotAuthorizedError with the user_not_authorized method
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Include Pundit's authorization methods
  include Pundit::Authorization
  # Before any action, configure the permitted parameters if it's a Devise controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :skip_pundit_authorization_for_devise
  after_action :verify_authorized

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
       end

  private
       def user_not_authorized
          flash[:alert] = "You are nor authorized person"
          redirect_to("main#welcome")
       end
     
     def skip_pundit_authorization_for_devise
          skip_authorization if devise_controller?
     end

end
