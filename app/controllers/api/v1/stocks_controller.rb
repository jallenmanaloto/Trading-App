module Api
    module V1
        class StocksController < ApplicationController
            skip_before_action :verify_authenticity_token
            respond_to :json

            def index
                user = User.find(params[:id])
                trader = user.trader
                stocks = trader.stocks.all
                               
                render json: { stocks: trader}
            end

            private

            def stock_params
                params.permit(:name, :symbol, :trader_id)
            end
        end
    end
end
