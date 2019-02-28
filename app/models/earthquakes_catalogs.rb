class EarthquakesCatalogs < ApplicationRecord
  self.table_name = 'earthquakes_catalogs'
  belongs_to :earthquake
  belongs_to :catalog
end
