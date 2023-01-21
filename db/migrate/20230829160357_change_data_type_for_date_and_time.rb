class ChangeDataTypeForDateAndTime < ActiveRecord::Migration[7.0]
  def up
    remove_column :flights, :date_and_time
    add_column :flights, :date_and_time, :datetime
  end

  def down
    remove_column :flights, :date_and_time
    add_column :flights, :date_and_time, :time
  end
end
