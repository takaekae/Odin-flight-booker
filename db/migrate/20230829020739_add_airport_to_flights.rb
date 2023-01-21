class AddAirportToFlights < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :departure_airport, null: false, foreign_key: { to_table: :airports }
  end
end
