class Api::InvestmentController < ApplicationController
    protect_from_forgery with: :exception, except: [:calculate_profit]

    def calculate_profit      
        res = []
        monto = investment_params[:monto].to_f
        criptos = Cripto.all
        criptos.each do |cripto|            
            cripto.class.send(:attr_accessor, :benefit)
            benefit = monto
            for a in 1..12 do                     
                porcentaje = (cripto.interes_mensual.to_f * benefit.to_f) / 100
                benefit = benefit + porcentaje                     
            end
            res.push(cripto.as_json.merge({ benefit: benefit.round(2) }))            
          end
        render json: res
    end    

    private
    
    def investment_params
        params.require(:investment).permit(:monto)
    end

end

