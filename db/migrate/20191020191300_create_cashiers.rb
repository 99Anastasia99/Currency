# frozen_string_literal: true

class CreateCashiers < ActiveRecord::Migration[6.0]
  def change
    create_table :cashiers do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :password_confirmation, null: false

      t.timestamps
    end
  end
end
