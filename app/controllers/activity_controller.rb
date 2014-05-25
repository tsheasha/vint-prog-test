class ActivityController < ApplicationController
  def index
  end

  def list_all
    @activities = Activity.all.order(date: :desc)
  end

  def register
    ActivityHelper.clean_params(params)
    Activity.create!(activity_params)
  end

  def statistics
    total_count = Activity.count
    @statistics = Hash.new

    if total_count > 0
        @statistics[:total_count] = total_count
        @statistics[:weekly_avg] = Activity.weekly_avg
        @statistics[:avg_duration] = Activity.average("duration")
        @statistics[:avg_speed] = Activity.avg_speed        
        @statistics
    end

  end

  private
  def activity_params
    params.permit(:date, :distance, :duration, :comment)
  end
end
