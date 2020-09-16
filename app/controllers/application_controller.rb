class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # before_action :authenticate_student!
  # before_action :authenticate_teacher!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon, :profile, :subject])
    # アカウント編集の時にストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :profile, :subject])
  end

end
