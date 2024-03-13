class ReservasController < ApplicationController
  before_action :authenticate_user!, only: [:index, :update_estado] # Requiere autenticación para acceder a estas acciones del controlador

  def index
    @reservas = current_user.reservas
  end

  def update_estado
    reserva = Reserva.find(params[:id])
    reserva.update(estado: params[:estado])
    redirect_to admin_reservas_path, notice: "Estado de reserva actualizado exitosamente."
  end

  def destroy
    reserva = Reserva.find(params[:id])
    reserva.destroy
    redirect_to admin_reservas_path, notice: "Reserva eliminada exitosamente."
  end
  
  
end

