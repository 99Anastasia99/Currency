# frozen_string_literal: true

class RenameSpecieToBanknot < ActiveRecord::Migration[6.0]
  def change
    rename_table :species, :banknotes
  end
end
