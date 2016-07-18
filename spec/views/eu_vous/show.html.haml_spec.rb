require 'rails_helper'

RSpec.describe "eu_vous/show", type: :view do
  before(:each) do
    @eu_vou = assign(:eu_vou, EuVou.create!(
      :euvou => false,
      :user => nil,
      :event => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
