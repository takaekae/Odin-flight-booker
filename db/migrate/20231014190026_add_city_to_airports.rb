class AddCityToAirports < ActiveRecord::Migration[7.0]
  def change
    add_column :airports, :city, :string
  end
end
