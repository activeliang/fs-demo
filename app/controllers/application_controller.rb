class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你不是管理员哦~"
    end
  end


  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
  end
end
