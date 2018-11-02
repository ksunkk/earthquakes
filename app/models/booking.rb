class Booking < ApplicationRecord
  belongs_to :conference

  def confirm!
    self.update_attributes(is_confirmed: true)
  end
end
