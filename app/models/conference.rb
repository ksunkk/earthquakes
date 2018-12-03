class Conference < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :bookings
  has_many :commentaries, as: :commentable

  scope :actual, -> { where('date >= ?', 30.days.ago) }

  def confirm!
    self.update_attributes(is_confirmed: true)
  end

  def address
    [city, street, building].compact.join(', ')
  end
end
