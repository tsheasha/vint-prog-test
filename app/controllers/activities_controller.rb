class ActivitiesController < ApplicationController

    def index
        @activities = Activity.list_activities(params)
        @activities
    end

    def create 
        ActivitiesHelper.clean_params(params)
        Activity.create!(activity_params)
    end

    def statistics
        @statistics = Activity.gen_statistics 
        @statistics
    end

    private
    def activity_params
        params.permit(:date, :distance, :duration, :comment)
    end
end
