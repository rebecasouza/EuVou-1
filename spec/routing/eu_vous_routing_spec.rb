require "rails_helper"

RSpec.describe EuVousController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/eu_vous").to route_to("eu_vous#index")
    end

    it "routes to #new" do
      expect(:get => "/eu_vous/new").to route_to("eu_vous#new")
    end

    it "routes to #show" do
      expect(:get => "/eu_vous/1").to route_to("eu_vous#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/eu_vous/1/edit").to route_to("eu_vous#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/eu_vous").to route_to("eu_vous#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/eu_vous/1").to route_to("eu_vous#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/eu_vous/1").to route_to("eu_vous#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/eu_vous/1").to route_to("eu_vous#destroy", :id => "1")
    end

  end
end
