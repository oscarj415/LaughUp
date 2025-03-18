# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    puts "=== DEBUG: Received params ==="
    puts params.inspect
    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :user_name,
      :user_type,
      :description,
      :insta_handle,
      :tiktok_handle,
      :facebook_handle,
      :X_handle,
      :youtube_handle,
      :address
    ])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :user_name,
      :user_type,
      :description,
      :insta_handle,
      :tiktok_handle,
      :facebook_handle,
      :X_handle,
      :youtube_handle,
      :address
    ])
  end
end
