require 'rails_helper'

def authenticated_header(user)
  token = Knock::AuthToken.new(payload: { sub: user.id }).token
  { 'Authorization': "Bearer #{token}" }
end

RSpec.describe 'Cards API', type: :request do
  before(:all) do
    @testUser = FactoryBot.create(:user, username: "Uniqueuser", email: "unique@email.com", password: "UNPassword123456", password_confirmation: "UNPassword123456", isAdmin: true)
  end
  describe 'GET /cards' do
    before do
      FactoryBot.create(:card, imdb_id:"tt0470752")
      FactoryBot.create(:card, imdb_id:"tt8134186")
      FactoryBot.create(:card, imdb_id:"tt2543312")
      FactoryBot.create(:card, imdb_id:"tt0133093")
    end

    it 'returns all Cards' do
      
      get '/api/cards/'
      #test for a successful status 200 response
      expect(response).to have_http_status(:success)
      #expect response body to return 4 card objects as created by facotry bot
      expect(JSON.parse(response.body).size).to eq(4)
    end
  end

  describe 'POST /cards' do 
    it 'create a new card' do
      expect {
        post '/api/cards',headers: authenticated_header(@testUser), params: {card: {imdb_id: 'tt4574334'}}
    }.to change { Card.count }.from(0).to(1) #If database is empty, one card should be created.
      
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /cards/:id' do
    let!(:card) { FactoryBot.create(:card, imdb_id:"tt0110912") }

    it 'deletes a card' do
      expect {
        delete "/api/cards/#{card.id}", headers: authenticated_header(@testUser)
    }.to change { Card.count }.from(1).to(0)
      
      expect(response).to have_http_status(204)
    end
  end
end

