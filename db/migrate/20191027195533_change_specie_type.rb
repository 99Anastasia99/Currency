# frozen_string_literal: true

class ChangeSpecieType < ActiveRecord::Migration[6.0]
  def change
    change_column :species, :purchase_rate, :float, default: 0.0, null: false
    change_column :species, :selling_rate, :float, default: 0.0, null: false
  end
end
