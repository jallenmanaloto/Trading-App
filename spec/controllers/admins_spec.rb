require 'rails_helper'

describe 'Admin Controller', type: :request do
    let(:user) {FactoryBot.create(:user, :id=> 100, :name => "testadmin", :email => "testadmin@email.com", :password => "password123")}
    let(:trader) {FactoryBot.create(:trader, :name => "testadmin", :email => "testadmin@email.com", :status => false)}
    context 'approving newly registered user' do
        it 'change trader status' do
            patch approve_account_api_v1_user_admin_path(trader.id, user.id)
            trader.reload
            # patch "/api/v1/users/#{user.id}/admins/#{user.id}/approve_account"

            expect(trader.status).to eq(true)
        end
    end
end