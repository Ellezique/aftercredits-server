require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end

# describe 'Users API', type: :request do
#   it 'returns all users' do
#     FactoryBot.create(:user, username: "testuser", email: "test@email.com", password: "123456", password_confirmation: "123456")
#     get '/api/users'
#     #test for a successful 200 response
#     expect(response).to have_http_status(:success)
#     #expect response body to return 2 user objects - 1 from seeds and one from factory bot
#     expect(JSON.parse(response.body).size).to eq(2)
#   end
# end


