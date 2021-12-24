module Api
    module V1
        class StocksController < ApplicationController
            skip_before_action :verify_authenticity_token
            respond_to :json

            def index
                stocks = Stock.all
                render json: { stocks: stocks }
            end

            def new
            end

            def create
                stock = Stock.create(stock_params.merge(latest_price: stock.latest_price, change_percent: stock.change_percent))
                if stock.save
                    render json: { stock: stock }
                else
                    format.json { render json: user.errors, status: :unprocessable_entity }
                end
            end

            private

            def stock_params
                params.require(:stock).permit(:name, :symbol)
            end
        end
    end
end
