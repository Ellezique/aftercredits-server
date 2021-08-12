FactoryBot.define do
  factory :user do
    username { "testuser" }
    email { "test@email.com" }
    password { "Password123456" } 
    password_confirmation { "Password123456" }
  end
end