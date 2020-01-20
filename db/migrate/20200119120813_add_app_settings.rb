class AddAppSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :app_settings do |t|
      t.float :max_operation_amount, default: 10_000
      t.float :min_operation_amount, default: 2
      t.float :min_rate, default: 2
      t.float :max_rate, default: 10_000
      t.integer :session_timeout_in, default: 30, null: false
    end
  end
end
