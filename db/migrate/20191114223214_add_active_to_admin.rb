# frozen_string_literal: true

class AddActiveToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :active, :boolean, default: true, null: false
  end
end
