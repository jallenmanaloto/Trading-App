Module Api
    Module v1
        class TradersController < ApplicationController
            def index
                traders = Trader.all
            end
        
            def show 
                trader = Trader.find(params[:id])
            end

            def edit
                trader = Trader.find(params[:id])
            end

            def update
                trader = Trader.find(params[:id])

                if trader.save
                    # render json response
                    # should redirect page
                else
                    # render json error message
                    # render { error.message, status: 422 }
                end
            end
        end
    end
end