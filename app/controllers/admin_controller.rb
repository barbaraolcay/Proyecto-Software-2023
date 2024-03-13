# frozen_string_literal: true

# This controller handles administrative tasks and actions.
class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def reservas
    @reservas = Reserva.all
  end

  def productos
    @productos = Producto.all
  end

  def resenas
    @resenas= Resena.all
  end


  def new_producto
    @producto = Producto.new
  end

  def create_producto
    @producto = Producto.new(producto_params)
    if @producto.save
      flash[:notice] = "Producto creado exitosamente."
      redirect_to admin_productos_path
    else
      render :new_producto
    end
  end

  def edit_producto
    @producto = Producto.find(params[:id])
  end

  def update_producto
    @producto = Producto.find(params[:id])
    if @producto.update(producto_params)
      flash[:notice] = "Producto actualizado exitosamente."
      redirect_to admin_productos_path
    else
      render :edit_producto
    end
  end

  def destroy_producto
    @producto = Producto.find(params[:id])
    @producto.destroy
    flash[:notice] = "Producto eliminado exitosamente."
    redirect_to admin_productos_path
  end

  private

  def authenticate_admin!
    return if current_user&.admin?

    redirect_to root_path, alert: "Acceso denegado. Debes ser administrador."
  end

  def producto_params
    params.require(:producto).permit(:nombre, :precio, :foto, :descripcion, :disponibilidad)
  end
end

