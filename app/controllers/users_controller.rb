class UsersController < ApplicationController
  def edit_profile
    @user = current_user
  end

  def update_profile
    current_user.update_attributes(params[:user])
  end

  def profile
    @user = current_user
  end


  private

  def after_sign_up_path_for(resource)
    new_phone_verification_path(resource)
  end

  def user_params
    params.require(:user).permit(:login, )
  end
end
