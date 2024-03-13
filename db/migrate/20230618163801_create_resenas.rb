class CreateResenas < ActiveRecord::Migration[7.0]
  def change
    create_table :resenas do |t|
      t.text :comentario
      t.integer :calificacion
      t.references :producto, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
