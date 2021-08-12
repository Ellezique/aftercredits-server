require 'rails_helper'

RSpec.describe Message, type: :model do
  subject {
    described_class.new(
      m_text: "The sound of music was made in 1965, can you believe it!?", 
      user_id: 1, 
      card_id: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a message" do
    subject.m_text = nil
    expect(subject).to_not be_valid
  end
end
