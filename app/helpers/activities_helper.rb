module ActivitiesHelper
    #A helper function to clean the params for the registering a new
    #Activity
    def self.clean_params(params)
        params[:duration] = ChronicDuration.parse(params[:duration])
        params[:date] = Date.strptime(params[:date], "%m/%d/%Y")
    end
end
