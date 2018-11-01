class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_user_confirmed
  protect_from_forgery with: :exception, prepend: true

  private

  def google_drive_client
    @gd_client ||= GoogleDriveService.new
  end

  def check_user_confirmed
  end
end
