require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end

# describe 'Messages API', type: :request do
#   it 'returns all messages' do
#     FactoryBot.create(:message, m_text: "Dev themes are so entertaining", user_id: 1, card_id: 1)
#     FactoryBot.create(:message, m_text: "Best movie ever!", user_id: 1, card_id: 1)
#     FactoryBot.create(:message, m_text: "Im a test bot ..beep beep", user_id: 2, card_id: 1)
#     get '/api/messages/'
#     #test for a successful 200 response
#     expect(response).to have_http_status(:success)
#     #expect response body to return 3 message objects as created by factory bot
#     # expect(JSON.parse(response.body).size).to eq(3)
#   end
# end


