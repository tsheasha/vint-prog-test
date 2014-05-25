require 'spec_helper'

describe ActivitiesController do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("activities/index")
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create', :date => "05/26/2014", :duration => "4m 30s", \
                                    :distance => "300", :comment => "Hello!"
      expect(response).to be_success
    end
  end

  describe "GET 'statistics'" do
    it "returns http success" do
      get :statistics
      expect(response).to be_success
    end
  end

end
