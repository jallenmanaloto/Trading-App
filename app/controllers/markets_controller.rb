class MarketsController < ApplicationController

    def index
        market = Market.first # change to find id of chosen stock
        render json: {
            current_price: market.latest_price,
            company: market.company_info,
            logo: market.logo,
            news: market.news_company
        }
    end

end