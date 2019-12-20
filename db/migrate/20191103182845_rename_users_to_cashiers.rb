# frozen_string_literal: true

class RenameUsersToCashiers < ActiveRecord::Migration[6.0]
  def change
    rename_table :users, :cashiers
    add_column :converters, :banknote_name_2, :string, default: nil
  end
end
