class TipoDocumentosController < ApplicationController
  before_action :set_tipo_documento, only: [:show, :update, :destroy]

  # GET /tipo_documentos
  def index
    @tipo_documentos = TipoDocumento.all

    render json: @tipo_documentos
  end

  # GET /tipo_documentos/1
  def show
    render json: @tipo_documento
  end

  # POST /tipo_documentos
  def create
    @tipo_documento = TipoDocumento.new(tipo_documento_params)

    if @tipo_documento.save
      render json: @tipo_documento, status: :created, location: @tipo_documento
    else
      render json: @tipo_documento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipo_documentos/1
  def update
    if @tipo_documento.update(tipo_documento_params)
      render json: @tipo_documento
    else
      render json: @tipo_documento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipo_documentos/1
  def destroy
    @tipo_documento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_documento
      @tipo_documento = TipoDocumento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_documento_params
      params.require(:tipo_documento).permit(:descripcion)
    end
end
