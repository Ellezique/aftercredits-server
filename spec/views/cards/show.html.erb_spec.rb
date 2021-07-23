require 'rails_helper'

RSpec.describe "cards/show", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      imdb_id: "Imdb"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Imdb/)
  end
end
