class Manager::BookingsController < ::ApplicationController
  def index
    @records = Booking.where(is_confirmed: false).preload(:conference)
    smart_listing_create :bookings,
                       @records,
                       partial: 'manager/bookings/list'
  end

  def show
    @record = Booking.find(params[:id])
  end

  def confirm
    Booking.find(params[:id]).confirm!
  end
end
