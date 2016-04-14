require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new())
  end

  it "shouldn`t renders new category form" do
    

    expect{render}.to raise_error(ActionView::MissingTemplate)
  end
end
