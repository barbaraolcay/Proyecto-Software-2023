# frozen_string_literal: true

# Migration to create Reservas table
class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
