require 'spec_helper'

describe ActivitiesHelper do
  describe "clean parameters" do
    it "transofrms time string to seconds and date string to object" do
      @params = {:duration => "3m 30s", :date => "05/26/2014"}
      ActivitiesHelper.clean_params(@params)
      expect(@params[:duration]).to eq(210)
      expect(@params[:date]).to eq(Date.strptime("05/26/2014", "%m/%d/%Y"))

    end
  end
end
