require 'rails_helper'


describe 'Trader controller', type: :request do
    let(:user) {FactoryBot.create(:user, :id=> 100, :name => "testadmin", :email => "testadmin@email.com", :password => "password123")}
    let(:trader) {FactoryBot.create(:trader, :name => "testadmin", :email => "testadmin@email.com", :status => false)}

    context 'get all stocks of trader' do
        it 'gets success status' do
            get  all_stocks_api_v1_user_trader_path(trader.id, trader.id)

            expect(response).to have_http_status(200)
        end

        it 'gets list of all traders' do
            get api_v1_user_traders_path(trader.id)

            expect(response).to_not be_nil
        end
    end

    # context 'buy a stock' do
    #     it 'trader total_cash will be updated' do
    #         patch '/api/v1/users/:user_id/traders/:trader_id/stocks/:id/buy_stock', :params => {:id => {trader.id}, :user_id => {trader.id}, :symbol => "AAPL"}
    #         trader.reload

    #         expect(trader.total_cash)
    #     end
    # end
end