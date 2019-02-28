class Catalog < ApplicationRecord
  has_many :earthquakes, through: :earthquakes_catalogs
end
