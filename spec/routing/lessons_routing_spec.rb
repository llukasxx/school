require "rails_helper"

RSpec.describe LessonsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "admin/lessons").to route_to("lessons#index")
    end

    it "routes to #new" do
      expect(:get => "admin/lessons/new").to route_to("lessons#new")
    end

    it "routes to #show" do
      expect(:get => "admin/lessons/1").to route_to("lessons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "admin/lessons/1/edit").to route_to("lessons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "admin/lessons").to route_to("lessons#create")
    end

    it "routes to #update" do
      expect(:put => "admin/lessons/1").to route_to("lessons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "admin/lessons/1").to route_to("lessons#destroy", :id => "1")
    end

  end
end
