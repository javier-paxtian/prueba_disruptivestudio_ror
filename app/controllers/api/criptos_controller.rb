class Api::CriptosController < ApplicationController
    before_action :set_cripto, only: [:show, :update, :destroy]
  
    def index
      @criptos = Cripto.all
      render json: @criptos
    end
  
    def show
      render json: @cripto
    end
  
    def create
      @cripto = Cripto.new(cripto_params)
      if @cripto.save
        render json: @cripto, status: :created
      else
        render json: @cripto.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @cripto.update(cripto_params)
        render json: @cripto
      else
        render json: @cripto.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @cripto.destroy
      head :no_content
    end
  
    private
  
    def set_cripto
      @cripto = Cripto.find(params[:id])
    end
  
    def cripto_params
      params.require(:cripto).permit(:moneda, :interes_mensual, :balance_ini)
    end

end  