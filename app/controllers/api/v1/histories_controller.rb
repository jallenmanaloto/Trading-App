module Api
    module V1
        class HistoriesController < ApplicationController
            def index
                trader = Trader.find(params[:id])
                history = trader.histories.all

                render json: { history: history }
            end

            def create
                trader = Trader.find(params[:id])
                history = trader.histories.build(history_params)
                if history.save
                    render json: { history: history }
                else
                    render json: { error: history.errors }
                end
            end

            private

            def history_params
                params.require(:history).permit(:transaction, :stock_name, :symbol, :quantity, :price)
            end
        end
    end
end