class MarketsController < ApplicationController

    def index
        market = Market.find(params[:id]) # change to find id of chosen stock
        render json: {
            current_price: market.latest_price,
            company: market.company_info,
            logo: market.logo,
            news: market.news_company,
            charts: market.chart
        }
    end

    def search
        # @market_stock = Market.where('LOWER(name) LIKE ?', "%#{params[:search].downcase}%") => returning the search params
        @market_stock = Market.last
        render json: { market_stock: @market_stock}
    end

end