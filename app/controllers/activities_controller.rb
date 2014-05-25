class ActivitiesController < ApplicationController

    def index
        #Returns the index page with a list of all registered activities
        @activities = Activity.list_activities(params)
        @activities
    end

    def create
        #Creates a new run activity with the input parameters
        #after formatting the parameters first 
        ActivitiesHelper.clean_params(params)
        Activity.create!(activity_params)
    end

    def statistics
        #Generate statistics on the registered activities
        @statistics = Activity.gen_statistics 
        @statistics
    end

    private
    def activity_params
        #Allows the parameters to be passed from a post request
        params.permit(:date, :distance, :duration, :comment)
    end
end
