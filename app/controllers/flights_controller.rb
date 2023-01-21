class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all
    @searched_flights = Flight.user_search(query_params)
    @num_of_passengers = query_params[:passengers]
    @departure_airport = Airport.where(id: query_params[:departure_airport_id])
    @arrival_airport = Airport.where(id: query_params[:arrival_airport_id])
    @departure_date = query_params[:departure_date]
  end

  private
  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id,
                                   :date)
  end

  def query_params
    params.permit(:departure_airport_id, :arrival_airport_id, :passengers,
                  :departure_time, :commit, :authenticity_token, :flight_id,
                  :departure_date)
  end
end
