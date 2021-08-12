require 'rails_helper'

RSpec.describe Card, type: :model do
  subject {
    described_class.new(imdb_id: "tt0059742")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an imdb id" do
    subject.imdb_id = nil
    expect(subject).to_not be_valid
  end
  #test associations and validations
  describe "Associations" do
    it { should have_many(:messages) }
  end

  describe "Validations" do
    it { should validate_presence_of(:imdb_id) }
  end
  
end

