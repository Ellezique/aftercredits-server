require 'rails_helper'

RSpec.describe "cards/index", type: :view do
  before(:each) do
    assign(:cards, [
      Card.create!(
        imdb_id: "Imdb"
      ),
      Card.create!(
        imdb_id: "Imdb"
      )
    ])
  end

  it "renders a list of cards" do
    render
    assert_select "tr>td", text: "Imdb".to_s, count: 2
  end
end
