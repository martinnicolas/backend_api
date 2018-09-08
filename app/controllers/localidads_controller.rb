class LocalidadsController < ApplicationController
  before_action :set_localidad, only: [:show, :update, :destroy]

  # GET /localidads
  def index
    @localidads = Localidad.all

    render json: @localidads.to_json(include: :provincia)
  end

  def localidades
    @localidades = Localidad.where(provincia_id: params[:provincia_id])
    render json: @localidades.to_json(include: :provincia)
  end

  # GET /localidads/1
  def show
    render json: @localidad
  end

  # POST /localidads
  def create
    @localidad = Localidad.new(localidad_params)

    if @localidad.save
      render json: @localidad, status: :created, location: @localidad
    else
      render json: @localidad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /localidads/1
  def update
    if @localidad.update(localidad_params)
      render json: @localidad
    else
      render json: @localidad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /localidads/1
  def destroy
    @localidad.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_localidad
      @localidad = Localidad.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def localidad_params
      params.require(:localidad).permit(:nombre, :provincia_id)
    end
end
