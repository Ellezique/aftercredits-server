require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      m_text: "MyText",
      user: nil,
      card: nil
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "textarea[name=?]", "message[m_text]"

      assert_select "input[name=?]", "message[user_id]"

      assert_select "input[name=?]", "message[card_id]"
    end
  end
end
