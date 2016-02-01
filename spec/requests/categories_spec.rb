require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it "categories_path should show MissingTemplate" do
      expect{get categories_path}.to raise_error(ActionView::MissingTemplate)
      #categorias não tem template
    end
  end
end
