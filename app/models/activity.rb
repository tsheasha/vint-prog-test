class Activity < ActiveRecord::Base
    validates :distance, presence: true
    validates :date, presence: true
    validates :duration, presence: true
    validates :comment, presence: false
    
    def self.avg_speed
        Activity.sum("distance") / Activity.sum("duration")
    end

    def self.weekly_avg
        total_count = Activity.count
        time_delta = (DateTime.now - Activity.order(date: :asc).first.date).to_int / 7
        if time_delta > 0
            total_count / time_delta 
        else
            total_count
        end
    end
    
    #A helper funciton to list all activities given the fields to list
    def self.list_activities(params)
        @fields = ["id", "distance", "date", "duration", "comment"]
        if params[:fields]
            @fields = params[:fields].split(",").push("id")
        end
        @activities = Activity.all.order(date: :desc).select(@fields)

        limit = params[:limit]
        limit ||= APP_CONFIG["api_limit"]
        @activities = @activities.limit(limit)
        
        if params[:offset]
            @activities = @activities.offset(params[:offset])
        end
        @activities
    end
    
    #A helper method to calculate that statistics of the current runs
    def self.gen_statistics
        total_count = Activity.count
        @statistics = Hash.new
        
        exist_activities = total_count > 0
        
        @statistics[:total_count] = total_count
        @statistics[:weekly_avg] =  exist_activities ? Activity.weekly_avg : 0
        @statistics[:avg_duration] = exist_activities ? Activity.average("duration") : 0
        @statistics[:avg_speed] = exist_activities ? Activity.avg_speed : 0
        @statistics
    
    end
end
