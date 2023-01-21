class ChangeDataTypeForTime < ActiveRecord::Migration[7.0]
  def change
    change_column(:flights, :time, :time)
  end
end
