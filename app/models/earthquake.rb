class Earthquake < ApplicationRecord
  has_many :photos
  has_many :pdf_articles

  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode
end
