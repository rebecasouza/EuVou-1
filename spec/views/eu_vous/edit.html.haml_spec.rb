require 'rails_helper'

RSpec.describe "eu_vous/edit", type: :view do
  before(:each) do
    @eu_vou = assign(:eu_vou, EuVou.create!(
      :euvou => false,
      :user => nil,
      :event => nil
    ))
  end

  it "renders the edit eu_vou form" do
    render

    assert_select "form[action=?][method=?]", eu_vou_path(@eu_vou), "post" do

      assert_select "input#eu_vou_euvou[name=?]", "eu_vou[euvou]"

      assert_select "input#eu_vou_user_id[name=?]", "eu_vou[user_id]"

      assert_select "input#eu_vou_event_id[name=?]", "eu_vou[event_id]"
    end
  end
end
