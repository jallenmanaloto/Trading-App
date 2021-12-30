require 'rails_helper'

describe 'User with devise', type: :request do
    before do |test|
        unless test.metadata[:skip_before]
            sign_in create(:user)
        end
    end

    context 'accessing page with valid sign in' do
        it 'redirects to root path' do
            get '/api/v1/users'
            expect(response).to have_http_status(302)
        end
    end

    context 'sign up', :skip_before do
        it 'returns 200 status' do
            post '/users'
            expect(response).to have_http_status(200)
        end
    end

    context 'accessing page without authentication', :skip_before do
        it 'raises error' do
            get '/api/v1/users'
            expect(response).to have_http_status(302)
        end
    end
end