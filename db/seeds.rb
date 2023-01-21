# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([
  { code: "YYZ", city: "Toronto" }, { code: "LGW", city: "London" },
  { code: "ATL", city: "Atlanta" }, { code: "DFW", city: "Dallas-Fort Worth" },
  { code: "ORD", city: "Chicago" }, { code: "LAS", city: "Las Vegas" },
  { code: "PHX", city: "Phoenix" }, { code: "MIA", city: "Miami" }
  ])

today = Date.today
month_from_today = Date.today + 14

(today..month_from_today).each do |date|
  FlightGenerator.call(date)
end
