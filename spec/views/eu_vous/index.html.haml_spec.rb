require 'rails_helper'

RSpec.describe "eu_vous/index", type: :view do
  before(:each) do
    assign(:eu_vous, [
      EuVou.create!(
        :euvou => false,
        :user => nil,
        :event => nil
      ),
      EuVou.create!(
        :euvou => false,
        :user => nil,
        :event => nil
      )
    ])
  end

  it "renders a list of eu_vous" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
