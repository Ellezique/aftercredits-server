require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:all) do
    @testUser = FactoryBot.create(:user, username: "Uniqueuser", email: "unique@email.com", password: "UNPassword123456", password_confirmation: "UNPassword123456")
    @testCard = FactoryBot.create(:card, imdb_id:"tt0061184")
  end
  subject {
    described_class.new(
      m_text: "The sound of music was made in 1965, can you believe it!?", 
      user: @testUser, 
      card: @testCard)
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a message" do
    subject.m_text = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a user" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a card" do
    subject.card_id = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:card) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_presence_of(:m_text) }
  end
end
