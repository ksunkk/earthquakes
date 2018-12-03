class EarthquakesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:load_file]

  def index
    @earthquakes = EarthquakesService.search(params[:params], current_user)
    @markers = @earthquakes.map { |r| { lat: r.latitude, lon: r.longitude, title: r.title } }
    if params['format'] == 'xlsx'
      render xlsx: 'earthquakes_list', template: 'earthquakes/index', disposition: 'attachment'
    elsif params['format'] == 'csv'
      send_data EarthquakesService.to_csv(@earthquakes), filename: "eartquakes-#{Time.now}.csv"
    else
      smart_listing_create :earthquakes,
                         @earthquakes,
                         partial: 'earthquakes/list'
    end
  end

  def show
    @record = Earthquake.find(params[:id])
  end

  def new; end

  def edit
    @record = Earthquake.find(params[:id])
  end

  def create
    files = params[:photos].to_a + params[:articles].to_a
    new_record = Earthquake.create(earthquake_params)
    google_drive_client.upload(files, record: new_record)
    redirect_to earthquake_path(new_record) 
  end

  def select_area; end
  def update; end
  def export_from_file; end

  def load_file
    file = params[:files].first.tempfile
    records = []
    CSV.foreach(file.path, headers: true) do |row|
      records << Earthquake.new(row.to_h)
    end
    Earthquake.import(items)
  end

  private

  def earthquake_params
    params.require(:earthquake).permit(:title, :latitude, :longitude, :year, :month, :day, :hour, :minute, :second, :photos, :articles)
  end
end
