class Stock < ApplicationRecord
    belongs_to :trader

    @@client = IEX::Api::Client.new(
            publishable_token: 'pk_dea2655fa642467f92990a1f0b4885d9',
            secret_token: 'sk_0810686b64154091a0432199577c12ae',
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
end
