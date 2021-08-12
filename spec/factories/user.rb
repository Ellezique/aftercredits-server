FactoryBot.define do
  factory :user do
    username { "factorybotuser" }
    email { "factorybot@email.com" }
    password { "BOTPassword123456" } 
    password_confirmation { "BOTPassword123456" }
  end
end