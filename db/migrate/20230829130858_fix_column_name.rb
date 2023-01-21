class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :time, :date_and_time
  end
end
