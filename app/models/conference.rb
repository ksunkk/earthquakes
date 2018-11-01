class Conference < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :bookings

  def address
    [city, street, building].compact.join(', ')
  end
end
