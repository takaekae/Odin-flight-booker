class ChangeDataTypeForDepartureTime < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :departure_time, :time
  end
end
