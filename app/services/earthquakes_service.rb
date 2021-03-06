class EarthquakesService
  def self.search(search_params, user)
    @records = Earthquake.all
    return @records if search_params.blank?
    @records = @records.joins(:catalogs).where("catalogs.code = ?", search_params[:catalog]) if search_params[:catalog]
    @records = @records.where('longitude::numeric = ?', search_params[:longitude]) if search_params[:longitude].present?
    @records = @records.where('latitude::numeric = ?', search_params[:latitude]) if search_params[:latitude].present?
    @records = @records.where('magnitude >= ?', search_params[:magnitude]) if search_params[:magnitude].present?
    @records = @records.where(year: search_params[:year]) if search_params[:year].present?
    @records = @records.where(month: search_params[:month]) if search_params[:month].present?
    @records = @records.where(day: search_params[:day]) if search_params[:day].present?
    @records
  end

  def self.to_csv(scope)
    csv_string = CSV.generate do |csv|
      csv << Earthquake.attribute_names
      scope.each do |r|
        csv << r.attributes.values
      end
    end 
  end

  private

  def search_by_catalog(catalog)
  end
end
