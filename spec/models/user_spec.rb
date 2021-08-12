require 'rails_helper'

RSpec.describe User, type: :model do
    subject {
      described_class.new(
        username: "Fakeuser", 
        email: "fakeuser@email.com", 
        password: "FakePassword123456", 
        password_confirmation: "FakePassword123456")
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  
    it "is not valid without a username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    describe "Associations" do
      it { should have_many(:messages) }
    end

    describe "Validations" do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:username) }
    end
  end