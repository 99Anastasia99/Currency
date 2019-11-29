class AddDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.datetime :current_date
    end
    add_column :operations, :сreated_at, :datetime, default: Date.today
  end
end
