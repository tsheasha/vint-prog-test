#Activities instance factory for testing purposes
FactoryGirl.define do 
    factory :activity do |f| 
        f.distance 700
        f.duration 210
        f.date Date.strptime("05/26/2014", "%m/%d/%Y") 
        f.comment "Hello!"
    end 
end
