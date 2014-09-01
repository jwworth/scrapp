require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        name: "Name"
      ),
      Player.create!(
        name: "Name2"
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 1
    assert_select "tr>td", text: "Name2".to_s, count: 1
  end
end
