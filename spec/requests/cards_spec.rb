require 'rails_helper'

# RSpec.describe "Cards", type: :request do
#   describe "GET /index" do
#     pending "add some examples (or delete) #{__FILE__}"
#   end
# end

describe 'Cards API', type: :request do
  describe 'GET /cards' do
    it 'returns all Cards' do
      FactoryBot.create(:card, imdb_id:"tt0470752")
      FactoryBot.create(:card, imdb_id:"tt8134186")
      FactoryBot.create(:card, imdb_id:"tt2543312")
      FactoryBot.create(:card, imdb_id:"tt0133093")

      get '/api/cards'

      #test for a successful 200 response
      expect(response).to have_http_status(:success)
      #expect response body to return 4 card objects as created by facotry bot
      expect(JSON.parse(response.body).size).to eq(4)
    end
  end

  describe 'POST /cards' do 
    it 'create a new card' do
      expect {
        post '/api/cards', params: {card: {imdb_id: 'tt4574334'}}
    }.to change { Card.count }.from(0).to(1) #If database is empty, one card should be created.
      
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /cards/:id' do
    it 'deletes a card' do
      FactoryBot.create(:card, imdb_id:"tt0133093")

      delete '/api/cards/1'

      expect(response).to have_http_status(:not_found)
    end
  end
end

