class Activity < ActiveRecord::Base
    validates :distance, presence: true
    validates :date, presence: true
    validates :duration, presence: true
    validates :comment, presence: false
    
    def self.avg_speed
        Activity.sum("distance") / Activity.sum("duration")
    end

    def self.weekly_avg
        time_delta = (DateTime.now - Activity.order(date: :asc).first.date).to_int / 7
        if time_delta > 0
            Activity.count / time_delta 
        else
            Activity.count
        end
    end 
end
