class BookingsController < ApplicationController
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