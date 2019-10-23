# frozen_string_literal: true

class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.decimal :purchase_rate
      t.decimal :selling_rate

      t.timestamps
    end
  end
end
