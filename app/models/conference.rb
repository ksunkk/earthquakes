class Conference < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :bookings

  def confirm!
    self.update_attributes(is_confirmed: true)
  end

  def address
    [city, street, building].compact.join(', ')
  end
end
