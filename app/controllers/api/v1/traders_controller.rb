Module Api
    Module v1
        class TradersController < ApplicationController
            def index
                traders = Trader.all
            end
        
            def show 
                trader = Trader.find_by(params[:id])
            end
        end
    end
end