class AddCashierToOperation < ActiveRecord::Migration[6.0]
  def change
    rename_table :converters, :operations
    add_column :operations, :cashier_name, :string, default: ""
    add_column :operations, :cashier_surname, :string, default: ""
  end
end
