class RemoveTimestampsFromOperations < ActiveRecord::Migration[6.0]
  def change
    remove_timestamps :operations
    remove_column :operations, :сreated_at, :datetime, default: Date.today
    add_column :operations, :date_of_operation, :datetime, default: Date.today
  end
end
