class UsersController < ApplicationController
  def edit_profile
    @user = current_user
  end

  def update_profile
    current_user.update_attributes(user_params)
  end

  def profile
    @user = current_user
  end


  private

  def after_sign_up_path_for(resource)
    new_phone_verification_path(resource)
  end

  def user_params
    params.require(:user).permit(:name, :last_name, :surname, :work_place, :email)
  end
end
