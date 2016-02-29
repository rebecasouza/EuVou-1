require 'rails_helper'

RSpec.describe "eu_vous/new", type: :view do
  before(:each) do
    assign(:eu_vou, EuVou.new(
      :euvou => false,
      :user => nil,
      :event => nil
    ))
  end

  it "renders new eu_vou form" do
    render

    assert_select "form[action=?][method=?]", eu_vous_path, "post" do

      assert_select "input#eu_vou_euvou[name=?]", "eu_vou[euvou]"

      assert_select "input#eu_vou_user_id[name=?]", "eu_vou[user_id]"

      assert_select "input#eu_vou_event_id[name=?]", "eu_vou[event_id]"
    end
  end
end
