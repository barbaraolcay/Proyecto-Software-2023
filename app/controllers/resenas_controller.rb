class ResenasController < ApplicationController
  before_action :set_resena, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @resenas = Resena.all
  end

  def show
  end

  def new
    @resena = Resena.new
  end

  def create
    @resena = Resena.new(resena_params)
    @resena.user = current_user
    if @resena.save
      redirect_to resenas_path, notice: 'Reseña creada exitosamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @resena.update(resena_params)
      redirect_to @resena, notice: 'Reseña actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    resena = Resena.find(params[:id])
    resena.destroy
    redirect_to admin_resenas_path, notice: "Reseña eliminada exitosamente."
    end
  end
  private

  def set_resena
    @resena = Resena.find(params[:id])
  end

  def resena_params
    params.require(:resena).permit(:producto_id, :calificacion, :comentario)
  end


