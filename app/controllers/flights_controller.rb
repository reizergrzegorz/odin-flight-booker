class FlightsController < ApplicationController
  def index
    @flights = Flight.all

    # Filtruj wyniki na podstawie parametrów wyszukiwania
    if params[:departure_airport_id].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
    end

    if params[:arrival_airport_id].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
    end

    if params[:flight_date].present?
      date = Date.parse(params[:flight_date])
      @flights = @flights.where('DATE(start_datetime) = ?', date)
    end

    # Przechowywanie wartości wyszukiwania, aby pozostały w formularzu
    @departure_airports = Airport.all
    @arrival_airports = Airport.all
    @num_passengers = params[:passengers]

    # Jeśli są dostępne loty, pokaż formularz do wyboru
    if @flights.any?
      @flights = @flights.map { |flight| { flight: flight, passengers: @num_passengers.to_i } }
    end
  end
end

  
