# frozen_string_literal: true

class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.references :user
      t.timestamps
    end
  end
end