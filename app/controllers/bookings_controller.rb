class BookingsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    @records = Booking.all.preload(:conference)
    smart_listing_create :bookings,
                       @records,
                       partial: 'bookings/list'
  end

  def show
    @record = Booking.find(params[:id])
  end

  def new
    @conference = Conference.find(params[:conference_id])
  end

  def create
    @booking = Booking.create(booking_params)
    render :success
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :phone, :conference_id)
  end
end