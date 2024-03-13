# frozen_string_literal: true

# Migration to create Productos table
class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.decimal :precio
      t.string :foto
      t.text :descripcion
      t.text :disponibilidad

      t.timestamps
    end
  end
end
