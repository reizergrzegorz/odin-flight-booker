class FlightsController < ApplicationController
    def index
      @airports = Airport.all
      @flights = Flight.all
  
      if params[:departure_airport_id].present?
        @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
      end
  
      if params[:arrival_airport_id].present?
        @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
      end
  
      if params[:date].present?
        @flights = @flights.where("DATE(start_datetime) = ?", params[:date])
      end
  
      if params[:passengers].present?
        # Handle passengers filtering logic if needed
      end
    end
  end
  
