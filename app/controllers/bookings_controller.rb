class BookingsController < ApplicationController
  def new
    # Find the flight that was selected
    @flight = Flight.find(params[:flight_id])
    @num_passengers = params[:passengers].to_i

    # Create a new booking with associated passengers
    @booking = Booking.new(flight: @flight, num_passengers: @num_passengers)

    # Create the required number of empty Passenger objects
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @num_passengers = params[:booking][:num_passengers].to_i
    @booking = Booking.new(booking_params)

    # Save the booking and passengers
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :num_passengers, passengers_attributes: [:name, :email])
  end
end

