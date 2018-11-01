require 'google/apis/drive_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

class GoogleDriveService
  attr_accessor :session

  def upload(files, record: nil)
    files.each do |f|
      info = session.upload_from_file(f.tempfile, f.original_filename, convert: false)
      if record
        file_db_class = f.content_type.match('image*').blank? ? PdfArticle : Photo
        file_db_class.create(title: f.original_filename, earthquake: record, file_id: info.id)
      end
    end
  end

  def self.file_by_id(id)
    session.file_by_id(id)
  end

  def self.session
    @session ||= GoogleDrive::Session.from_service_account_key(Rails.root.join('config/google_drive_config.json'))
  end
end
