require 'spec_helper'

describe Activity do
    it "has a valid factory" do 
        FactoryGirl.create(:activity).valid? 
    end
    it "is invalid without date" do 
        !FactoryGirl.build(:activity, date: nil).valid? 
    end
    it "is invalid without duration" do 
        !FactoryGirl.build(:activity, duration: nil).valid? 
    end
    it "is invalid without distance" do 
        !FactoryGirl.build(:activity, distance: nil).valid? 
    end
    it "is valid without comment" do 
        FactoryGirl.build(:activity, comment: nil).valid? 
    end
    it "returns average speed of runs" do 
        FactoryGirl.create(:activity, distance: 200, duration: 10) 
        FactoryGirl.create(:activity, distance: 300, duration: 10) 
        expect(Activity.avg_speed).to eq(25)
    end
    it "returns average weekly runs" do 
        FactoryGirl.create(:activity) 
        FactoryGirl.create(:activity)     
        FactoryGirl.create(:activity, date: Date.strptime("05/01/2014", "%m/%d/%Y"))
        FactoryGirl.create(:activity, date: Date.strptime("05/01/2014", "%m/%d/%Y"))          
        FactoryGirl.create(:activity, date: Date.strptime("05/01/2014", "%m/%d/%Y"))          
        FactoryGirl.create(:activity, date: Date.strptime("05/01/2014", "%m/%d/%Y"))          
        FactoryGirl.create(:activity, date: Date.strptime("05/01/2014", "%m/%d/%Y"))          

        expect(Activity.weekly_avg).to eq(2)
    end
    describe "action on activities" do
        before :each do
           FactoryGirl.create(:activity) 
           FactoryGirl.create(:activity)     
           FactoryGirl.create(:activity)
           FactoryGirl.create(:activity)          
           FactoryGirl.create(:activity)          
           FactoryGirl.create(:activity)          
           FactoryGirl.create(:activity) 
        end
        context "activities list" do          
            it "returns all activities list" do          
                expect(Activity.list_activities({}).size).to eq(7)
                expect(Activity.list_activities({:limit => 3}).size).to eq(3) 
            end
        end
        context "statistics" do         
            it "returns activities statistics" do
                @statistics = Activity.gen_statistics
                expect(@statistics[:total_count]).to eq(7)
                expect(@statistics[:weekly_avg]).to eq(7)
                expect(@statistics[:avg_speed].round()).to eq(3)
                expect(@statistics[:avg_duration]).to eq(210)
            end
        end
    end
end
