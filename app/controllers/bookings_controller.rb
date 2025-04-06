class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_passengers = params[:passengers].to_i
    @booking = Booking.new
  end

  def create
  end
end
