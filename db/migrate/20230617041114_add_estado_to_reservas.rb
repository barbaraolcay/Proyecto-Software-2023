class AddEstadoToReservas < ActiveRecord::Migration[7.0]
  def change
    add_column :reservas, :estado, :string, default: "Pendiente"
  end
end
