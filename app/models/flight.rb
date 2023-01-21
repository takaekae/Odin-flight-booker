class Flight < ApplicationRecord
  has_many :bookings
  has_many :passengers, through: :bookings
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_time, presence: true
  validates :duration, presence: true

  def self.user_search(query_params)
    where(departure_airport_id: query_params[:departure_airport_id],
          arrival_airport_id: query_params[:arrival_airport_id],
          departure_date: query_params[:departure_date])
  end

  def departure_date_formatted
    departure_date.strftime("%B %d, %Y")
  end

  def departure_time_formatted
    departure_time.strftime("%l:%M %P")
  end

  def flight_info
    "#{departure_airport.city} to #{arrival_airport.city} on #{departure_date}
     at #{departure_time_formatted}. Duration: #{duration.to_i} hours"
  end
end
