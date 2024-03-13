# frozen_string_literal: true

# Controlador para la gestión de productos
class ProductosController < ApplicationController
  before_action :authenticate_user!, only: [:reservar] # Requiere autenticación para acceder a la acción reservar

  def parlantes
    @productos = Producto.all
  end
  
  def reservar
    if user_signed_in?
      producto = Producto.find(params[:id])
      reserva = Reserva.find_by(producto_id: producto.id, user_id: current_user.id)
  
      if reserva
        flash[:alert] = "Ya tienes una reserva realizada para este producto."
      else
        reserva = Reserva.new(producto_id: producto.id, user_id: current_user.id)
  
        if reserva.save
          flash[:notice] = "¡Producto reservado exitosamente!"
        else
          flash[:alert] = "Error al reservar el producto."
        end
      end
    end
  
    redirect_to render_parlantes_path
  end
  

  def cancelar_reserva
    reserva = current_user.reservas.find_by(producto_id: params[:id])
    reserva.destroy if reserva
  
    redirect_to render_parlantes_path, notice: "Reserva cancelada exitosamente."
  end


end
  

  




