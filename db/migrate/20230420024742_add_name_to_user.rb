# frozen_string_literal: true

# This migration adds the name column to the users table.
class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
  end
end
