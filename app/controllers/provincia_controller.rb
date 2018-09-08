class ProvinciaController < ApplicationController
  before_action :set_provincium, only: [:show, :update, :destroy]

  # GET /provincia
  def index
    @provincia = Provincium.all

    render json: @provincia
  end

  # GET /provincia/1
  def show
    render json: @provincium
  end

  # POST /provincia
  def create
    @provincium = Provincium.new(provincium_params)

    if @provincium.save
      render json: @provincium, status: :created, location: @provincium
    else
      render json: @provincium.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /provincia/1
  def update
    if @provincium.update(provincium_params)
      render json: @provincium
    else
      render json: @provincium.errors, status: :unprocessable_entity
    end
  end

  # DELETE /provincia/1
  def destroy
    @provincium.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provincium
      @provincium = Provincium.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def provincium_params
      params.require(:provincium).permit(:nombre)
    end
end
