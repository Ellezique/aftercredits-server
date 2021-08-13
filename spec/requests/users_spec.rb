require 'rails_helper'

RSpec.describe "Users API authentication", type: :request do
  before(:all) do
    FactoryBot.create(:user, username: "Uniqueuser1", email: "unique1@email.com", password: "UNPassword123456", password_confirmation: "UNPassword123456")
  end
  describe 'POST /api/auth/sign_in' do 
    it 'existing user sign in' do
      post '/api/auth/sign_in', params: {user: {email: "unique1@email.com", password: "UNPassword123456", password_confirmation: "UNPassword123456" }}
      expect(response).to have_http_status(200) 
    end
  end
end
