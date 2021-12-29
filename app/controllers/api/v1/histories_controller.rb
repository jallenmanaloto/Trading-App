module Api
    module V1
        class HistoriesController < ApplicationController
            skip_before_action :verify_authenticity_token
            def index
                trader = Trader.find(params[:id])
                history = trader.histories.all

                render json: { history: history }
            end
        end
    end
end