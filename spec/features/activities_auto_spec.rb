require 'spec_helper'

describe "utilize features of the application and get correct response", :js => true do 
  it "Gets list of activities" do
    visit '/'
    expect(page).to have_content 'There are no activities yet, be the first!'
  end
  
  it "creates new run activity" do
    visit '/'
    within("#actForm") do
      fill_in 'date', :with => '05/26/2014'
      fill_in 'duration', :with => '6m 39s'
      fill_in 'distance', :with => '699'
      fill_in 'comment', :with => 'Nice!'
    end
    click_button 'Brag about your running activity'
    expect(page).to have_content 'Awesome run!'
    visit '/'
    expect(page).to have_content '699.0 m in 6 minutes 39 seconds'
  end

    it "Gets statistics" do
    visit '/'
    expect(page).to have_content '0 Average runs per week'    
    within("#actForm") do
      fill_in 'date', :with => '05/26/2014'
      fill_in 'duration', :with => '6m 39s'
      fill_in 'distance', :with => '699'
      fill_in 'comment', :with => 'Nice!'
    end
    click_button 'Brag about your running activity'
    click_button 'Display latest Statistics'    
    expect(page).to have_content '1 Average runs per week'    
  end
end

