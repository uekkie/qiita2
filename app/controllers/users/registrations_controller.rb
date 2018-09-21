class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:update]

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:name, :email, :password_confirmation, :current_password)
    end
  end
end