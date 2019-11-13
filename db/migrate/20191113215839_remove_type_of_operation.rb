# frozen_string_literal: true

class RemoveTypeOfOperation < ActiveRecord::Migration[6.0]
  def change
    remove_column :converters, :type_of_operation
  end
end
