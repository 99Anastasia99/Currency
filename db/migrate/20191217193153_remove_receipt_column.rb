# frozen_string_literal: true

class RemoveReceiptColumn < ActiveRecord::Migration[6.0]
  def change
    create_table :base_currencies do |t|
      t.string :name, default: "BYN"
    end
    drop_table :receipts
  end
end
