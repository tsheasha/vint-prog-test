require 'spec_helper'

describe "Activities API" do
    before do
      activities = FactoryGirl.create(:activity, :distance => "700")
      activities = FactoryGirl.create(:activity)
    end
  
    it "lists all activities" do
      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      get "/api/activities", request_headers

      expect(response.status).to eq 200
      expect(response.body["activities"].size).not_to be_nil
    end
    
    it "lists 2 fields from activities" do
      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      get "/api/activities?fields=date,duration", request_headers

      expect(response.status).to eq 200
      result = JSON.parse(response.body)["activities"]
      expect(result[-1]["date"]).to eq "2014-05-26"
      expect(result[-1]["duration"]).to eq "210.0"
      expect(result[-1]["distance"]).to eq nil
      expect(result[-1]["comment"]).to eq nil
    end
     
    it "creates an activity" do
      activity_params = {
        "duration" => "4m 30s", "date" => "05/26/2014", "comment" => "Done!", "distance" => "2"
        }.to_json

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      post "/api/activities", activity_params, request_headers

      expect(response.status).to eq 201 # created
      expect(Activity.last.comment).to eq "Done!"
    end
    
    it "gets statistics on activities" do
      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      get "/api/activities/statistics", request_headers

      expect(response.status).to eq 200
      result = JSON.parse(response.body)["data"]
      expect(result["total_count"]).to eq 2 
      expect(result["weekly_avg"]).to eq 2
      expect(result["avg_duration"]).to eq "210.0"
      expect(result["avg_speed"].to_i).to eq 3

    end

end

