# frozen_string_literal: true

class RenameCashierToAdmin < ActiveRecord::Migration[6.0]
  def change
    rename_table :cashiers, :admins
  end
end
