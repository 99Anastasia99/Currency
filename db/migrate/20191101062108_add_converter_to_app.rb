# frozen_string_literal: true

class AddConverterToApp < ActiveRecord::Migration[6.0]
  def change
    create_table :converters do |t|
      t.string :banknote_name
      t.string :type_of_operation
      t.string :user_name
      t.string :user_surname
      t.float :amount, default: 0.0, null: false
      t.float :selling_rate, default: 0.0, null: false
      t.float :purchase_rate, default: 0.0, null: false
      t.float :result, default: 0.0, null: false
    end
    add_reference :banknotes, :converter, index: true
  end
end
