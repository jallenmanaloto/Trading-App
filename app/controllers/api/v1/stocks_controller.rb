module Api
    module V1
        class StocksController < ApplicationController
            skip_before_action :verify_authenticity_token
            respond_to :json

            def index
                trader = Trader.find(params[:trader_id])
                stocks = trader.stocks 
                trader_stock = stocks.group_by { |stock| stock[:symbol] }
                .values
                .map do |_, stock|
                    stock.reduce do |a, b|
                        a.merge(b) {|k, ov, nv| k == :symbol ? ov : ov + nv}
                    end
                end
                render json: { stocks: trader_stock }

            end

            def new
            end

            def create
                stock = Stock.create(stock_params)
                if stock.save
                    stock.update(latest_price: stock.latest_price.to_f.round(2), change_percent: stock.change_percent.to_f.round(5))
                    render json: { stock: stock }
                else
                    format.json { render json: stock.errors, status: :unprocessable_entity }
                end
            end

            private

            def stock_params
                params.permit(:name, :symbol, :trader_id, :quantity)
            end
        end
    end
end
