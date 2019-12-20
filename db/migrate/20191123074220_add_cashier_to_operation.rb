# frozen_string_literal: true

class AddCashierToOperation < ActiveRecord::Migration[6.0]
  def change
    rename_table :converters, :operations
    add_column :operations, :type_of_operation, :string, default: ""
    add_column :operations, :cashier_name, :string, default: ""
    add_column :operations, :cashier_surname, :string, default: ""
    add_timestamps :operations, default: DateTime.now
  end
end
