class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :update, :destroy]

  # GET /personas
  def index
    @personas = Persona.all

    #render json: @personas.to_json(include: { :tipo_documento => { :only => :descripcion }})
    render json: @personas.to_json(include: [:tipo_documento, { :localidad => { :include => :provincia }}])
  end

  # GET /personas/1
  def show
    render json: @persona.to_json(include: [:tipo_documento, { :localidad => { :include => :provincia }}])
  end

  # POST /personas
  def create
    @persona = Persona.new(persona_params)

    if @persona.save
      render json: @persona, status: :created, location: @persona
    else
      render json: @persona.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /personas/1
  def update
    if @persona.update(persona_params)
      render json: @persona
    else
      render json: @persona.errors, status: :unprocessable_entity
    end
  end

  # DELETE /personas/1
  def destroy
    @persona.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def persona_params
      #params.require(:persona).permit(:tipo_documento_id, :numero_documento, :apellido, :nombre, :localidad_id)
      params.permit(:tipo_documento_id, :numero_documento, :apellido, :nombre, :localidad_id)
    end
end
