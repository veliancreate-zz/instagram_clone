class RegistrationsController < Devise::RegistrationsController

  def after_sign_out_path_for(resource)
    redirect_to '/posts'
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :user_name, :password, :password_confirmation, :image)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :user_name, :password, :password_confirmation, :current_password, :image)
  end
end
