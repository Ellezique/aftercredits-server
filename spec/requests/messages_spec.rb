require 'rails_helper'

# RSpec.describe "Messages", type: :request do
#   describe "GET /index" do
#     pending "add some examples (or delete) #{__FILE__}"
#   end
# end

describe 'Cards API', type: :request do
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