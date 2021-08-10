require 'rails_helper'

# RSpec.describe "Messages", type: :request do
#   describe "GET /index" do
#     pending "add some examples (or delete) #{__FILE__}"
#   end
# end

# before(:each) do
#   ?????token = Knock::AuthToken.new(payload: { sub: user.id }).token
#   ??????{ 'Authorization': "Bearer #{token}"
# end

describe 'Messages API', type: :request do
  describe 'GET /api/messages' do
    before do
      FactoryBot.create(:card, imdb_id:"tt0470752")
      FactoryBot.create(:user, username: "testuser", email: "test@email.com", password: "Password123456", password_confirmation: "Password123456")
      FactoryBot.create(:message, m_text: "Dev themes are so entertaining", user_id: 1, card_id: 1)
      FactoryBot.create(:message, m_text: "Best movie ever!", user_id: 1, card_id: 1)
      FactoryBot.create(:message, m_text: "Im a test bot ..beep beep", user_id: 2, card_id: 1)
    end

    it 'returns all Messages' do
      
      get '/api/messages/'

      #test for a successful 200 response
      expect(response).to have_http_status(:success)
      #expect response body to return 3 message objects as created by facotry bot
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'POST /messages' do 
    it 'create a new message' do
      expect {
        post '/api/messages', params: {message: {m_text: "This movie was so long! It just went on and on.", user_id: 1, card_id: 1}}
    }.to change { Message.count }.from(3).to(4) 
    #Database has x messages and one new message should be added to make x + 1.      
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /messages/:id' do
    let!(:message) { FactoryBot.create(:message, m_text: "Dev themes are so entertaining", user_id: 1, card_id: 1) }

    it 'deletes a message' do
      expect {
        delete "/api/messages/#{message.id}"
    }.to change { Message.count }.from(1).to(0)
      
      expect(response).to have_http_status(204)
    end
  end
end


