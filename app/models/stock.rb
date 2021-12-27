class Stock < ApplicationRecord
    belongs_to :trader

    @@client = IEX::Api::Client.new(
        publishable_token: 'pk_a020ad363b0b447185bf2db1cfd11154',
        secret_token: 'sk_4e277e5f5d884ae987d56fca67577a68',
        endpoint: 'https://cloud.iexapis.com/v1'
    )

    def latest_price
        quote = @@client.quote(self.symbol)
        quote.latest_price
    end

    def change_percent
        quote = @@client.quote(self.symbol)
        quote.change_percent
    end

    def calculate_quantity(quantity)
        current_price = self.latest_price
        shares = (quantity/current_price).round(6)
    end

    def sell_stock(quantity)
        # deduct amount of quantity to be sold
        # calculate equity and add to trader's total_cash
    end
end
