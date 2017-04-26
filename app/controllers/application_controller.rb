class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :aavatar, :aavatar_cache) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :password, :password_confirmation, :current_password, :aavatar, :aavatar_cache, :remove_aavatar) }
  end

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你不是管理员哦~"
    end
  end

  before_action :store_current_location, :unless => :devise_controller?

  private
  
  def store_current_location
    store_location_for(:user, request.url)
  end
end
