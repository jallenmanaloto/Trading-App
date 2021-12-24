class Market < ApplicationRecord

    @@client = IEX::Api::Client.new(
            publishable_token: 'pk_dea2655fa642467f92990a1f0b4885d9',
            secret_token: 'sk_0810686b64154091a0432199577c12ae',
            endpoint: 'https://cloud.iexapis.com/v1'
        )

    def latest_price()
        quote = @@client.quote(self.symbol)
        quote.latest_price
    end

    def company_info
        company = @@client.company(self.symbol)
    end

    def logo
        logo = @@client.logo(self.symbol)
    end

    def news_company
        news = @@client.news(self.symbol)
    end

    def chart
        chart = @@client.chart(self.symbol)
    end
end
