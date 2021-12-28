module Api
    module V1
        class TradersController < ApplicationController

            skip_before_action :verify_authenticity_token
            respond_to :json

            def index
                traders = Trader.all
                render json: {trader: trader}
            end
        
            def show 
                trader = Trader.find(params[:id])
                render json: { trader: trader }
            end
        
            def edit
                trader = Trader.find(params[:id])
            end

            def create
                user = User.create(trader_params)
                trader = Trader.create(:name => user.name, :email => resource.email, :user_id => resource.id, :status => false)
            end

            def buy_stock
                trader = Trader.find(params[:id])
                stock_to_buy = Market.find_by(:symbol => params[:symbol])
                buy_cash = params[:amount_bought].to_i
                trader_cash = trader.total_cash
                trader.buy_stock(buy_cash)
                price =  stock_to_buy.latest_price
                shares = (buy_cash/price).to_f

                if buy_cash > trader_cash
                    render json: {error: "Not enough funds!"}
                else
                    stock = trader.stocks.find_or_create_by(symbol: stock_to_buy.symbol)
                    stock.update(
                    symbol: stock.symbol, 
                    latest_price: stock.latest_price, 
                    change_percent: stock.change_percent, 
                    name: stock.company_name, 
                    company_logo: stock_to_buy.logo,
                    quantity: stock.calculate_quantity(shares)
                    )
                    
                    trader.update(total_cash: trader.total_cash)
                    render json: { amount_paid: buy_cash, trader: trader, stock: stock }
                end
            end

            def sell_stock
                # Cannot sell more than the available shares/equity from stock
                trader = Trader.find(params[:id])
                stock = Stock.find(params[:id])
                stock_equity = stock.latest_price * stock.quantity
                buy_cash = params[:amount_sold]
                trader_cash = trader.total_cash

                render json: { stock_equity: stock_equity, stock_quantity: stock.quantity }
            end
        
            def deposit_money # change method name to deposit_money
                trader = Trader.find(params[:id])
                amount = params[:total_cash]
                total_cash = trader.deposit_money(amount)
                
                if trader.update(total_cash: total_cash)
                    # render json response
                    # should redirect page
                    render json: { trader: trader }
                else
                    # render json error message
                    render json: { errors: trader.errors }
                end
            end

            private
        
            def trader_params
                params.permit(:name, :email)
            end
        end
    end
end




