class ConferencesController < ApplicationController
  def index
    @conferences = ConferencesService.search(params[:params], current_user)
    @markers = @conferences.map { |r| { address: r.address } }
    if params['format'] == 'xlsx'
      render xlsx: 'conferences_list', template: 'conferences/index', disposition: 'attachment'
    else
      smart_listing_create :conferences,
                         @conferences,
                         partial: 'conferences/list'
    end
  end

  def show
    @record = Conference.find(params[:id])
  end

  def new
  end

  def edit
    @record = Conference.find(params[:id])
  end

  def update

  end

  def create
    files = params[:photos].to_a + params[:articles].to_a
    new_record = Conference.create(conference_params.merge(is_confirmed: false))
    google_drive_client.upload(files, record: new_record)
    redirect_to conference_path(new_record) 
  end

  def export_from_file
  end

  def load_file
    file = params[:files].first.tempfile
    records = []
    CSV.foreach(file.path, headers: true) do |row|
      records << Conference.new(row.to_h)
    end
    Conference.import(items)
  end

  private

  def conference_params
    params.require(:conference).permit(:title, :city, :date, :street, :building, :source_link)
  end
end 