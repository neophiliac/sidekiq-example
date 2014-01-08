require "spec_helper"

describe SiteStatsController do
  describe "routing" do

    it "routes to #index" do
      get("/site_stats").should route_to("site_stats#index")
    end

    it "routes to #new" do
      get("/site_stats/new").should route_to("site_stats#new")
    end

    it "routes to #show" do
      get("/site_stats/1").should route_to("site_stats#show", :id => "1")
    end

    it "routes to #edit" do
      get("/site_stats/1/edit").should route_to("site_stats#edit", :id => "1")
    end

    it "routes to #create" do
      post("/site_stats").should route_to("site_stats#create")
    end

    it "routes to #update" do
      put("/site_stats/1").should route_to("site_stats#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/site_stats/1").should route_to("site_stats#destroy", :id => "1")
    end

  end
end
