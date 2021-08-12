require 'rails_helper'

def authenticated_header(user)
  token = Knock::AuthToken.new(payload: { sub: user.id }).token
  { 'Authorization': "Bearer #{token}" }
end


RSpec.describe 'Messages API', type: :request do
  before(:all) do
    FactoryBot.create(:card, imdb_id:"tt0061184")
    @testUser = FactoryBot.create(:user, username: "Uniqueuser", email: "unique@email.com", password: "UNPassword123456", password_confirmation: "UNPassword123456")
    # @testCard = FactoryBot.create(:card, imdb_id:"tt0061184")
    # FactoryBot.create(:message, m_text: "Dev themes are so entertaining", user_id: 1, card_id: 1)
    # FactoryBot.create(:message, m_text: "Best movie ever!", user_id: 1, card_id: 1)
    FactoryBot.create(:message, m_text: "Dev themes are so entertaining", user: @testUser)
    FactoryBot.create(:message, m_text: "Best movie ever!", user: @testUser)
  end
  describe 'GET /api/messages' do
    it 'returns all Messages' do
      
      get '/api/messages/', headers: authenticated_header(@testUser)
      
      #test for a successful 200 response
      expect(response).to have_http_status(:success)
      #expect response body to return 3 message objects as created by facotry bot
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /messages' do 
    it 'create a new message' do
      expect {
        # post '/api/messages', params: {message: {m_text: "This movie was so long! It just went on and on.", user_id: 1, card_id: 1}}
        post '/api/messages', params: {message: {m_text: "This movie was so long! It just went on and on."}, card_id: 1 }, headers: authenticated_header(@testUser)
      }.to change { Message.count }.from(2).to(3) 
    #Database has x messages and one new message should be added to make x + 1.      
      expect(response).to have_http_status(:created)
      pp response
    end
  end

  # describe 'DELETE /messages/:id' do
  #   # let!(:message) { FactoryBot.create(:message, m_text: "Lorem ipsum dolor sit amet", user_id: 1, card_id: 1) }
  #   let!(:message) { FactoryBot.create(:message, m_text: "Lorem ipsum dolor sit amet") }
  #   it 'deletes a message' do
  #     expect {
  #       delete "/api/messages/#{message.id}"
  #   }.to change { Message.count }.from(1).to(0)
      
  #     expect(response).to have_http_status(204)
  #   end
  # end
end


