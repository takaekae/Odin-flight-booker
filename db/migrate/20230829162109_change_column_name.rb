class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :date_and_time, :departure_time
  end
end
