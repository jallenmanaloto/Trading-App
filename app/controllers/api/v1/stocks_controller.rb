module Api
    module V1
        class StocksController < ApplicationController
            skip_before_action :verify_authenticity_token
            respond_to :json

            def index
                trader = Trader.find(params[:trader_id])
                stocks = trader.stocks.all
                               
                render json: { stocks: stocks}
            end

            # To be deleted and migrate creation of new/update of stocks to buy_stock method
            def stock_quantity
                trader = Trader.find(params[:trader_id])
                stocks = trader.stocks
                @trader_sum_stock = stocks.group_by { |stock| stock[:symbol] }
                .values
                .map do |a| 
                    { stock: a.first.name , total_shares: a.map(&:quantity).inject(0, &:+), all: a }
                end
                               
                render json: { stocks: @trader_sum_stock}
            end

            def buy_stock
                # use find_or_create_by method to create or update a chosen stock
            end


            def sell_stock
                trader = Trader.last
                render json: { sell_stock: trader }
            end

            def create
                stock = Stock.create(stock_params)
                amount = params[:amount_bought].to_f
                logo = params[:symbol]
                if stock.save
                    stock.update(
                        latest_price: stock.latest_price.to_f.round(2), 
                        change_percent: stock.change_percent.to_f.round(5), 
                        quantity: stock.calculate_quantity(amount), 
                        company_logo: stock.company_logo(logo)
                    )
                    render json: { stock: stock }
                else
                   render json: stock.errors
                end
            end

            private

            def stock_params
                params.permit(:name, :symbol, :trader_id)
            end
        end
    end
end
