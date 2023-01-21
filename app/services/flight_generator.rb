class FlightGenerator < ApplicationService
  def initialize(date)
    @date = date
  end

  def call
    airport_pairs.each do |pair|
      airport1 = Airport.find_by(code: pair[0])
      airport2 = Airport.find_by(code: pair[1])
      random_duration = rand(3..10)

      create_flights(morning_time, random_duration, airport1, airport2)
      create_flights(afternoon_time, random_duration, airport1, airport2)
    end
  end

  def create_flights(time, duration, airport1, airport2)
    Flight.create(departure_date: @date, duration: duration,
                  departure_time: time,
                  departure_airport_id: airport1.id,
                  arrival_airport_id: airport2.id)
  end

  def random_time
    Faker::Time.between_dates(from: @date, to: @date, period: :all)
  end

  def airport_pairs
    ["YYZ", "LGW", "ATL", "DFW",
     "ORD", "LAS", "PHX", "MIA"].permutation(2)
  end

  def morning_time
    Faker::Time.between_dates(from: @date, to: @date, period: :morning)
  end

  def afternoon_time
    Faker::Time.between_dates(from: @date, to: @date, period: :afternoon)
  end
end
