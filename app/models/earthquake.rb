class Earthquake < ApplicationRecord
  has_many :photos
  has_many :pdf_articles
  has_many :commentaries, as: :commentable
  has_and_belongs_to_many :catalogs
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode
end
