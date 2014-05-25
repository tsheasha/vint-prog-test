require 'spec_helper'

describe ActivityController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'list_all'" do
    it "returns http success" do
      get 'list_all'
      expect(response).to be_success
    end
  end

  describe "GET 'register'" do
    it "returns http success" do
      get 'register'
      expect(response).to be_success
    end
  end

  describe "GET 'statistics'" do
    it "returns http success" do
      get 'statistics'
      expect(response).to be_success
    end
  end

end
