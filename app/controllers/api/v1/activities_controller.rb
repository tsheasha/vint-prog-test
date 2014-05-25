class API::V1::ActivitiesController < ApplicationController

  def index
    # Returns to api caller list of all activities
    # as a JSON object defined in the respective RABL file
    @activities = Activity.list_activities(params)
    request.env['HTTP_ACCEPT_ENCODING'] = 'gzip'
    render 'api/v1/index'
  end

  def create
    # Returns to api caller a confirmation that their
    # new run activity has been created
    ActivitiesHelper.clean_params(params)
    Activity.create!(activity_params)
    request.env['HTTP_ACCEPT_ENCODING'] = 'gzip'         
    msg = { :status => "OK", :message => "Success!"}
    render :json => msg, :status => 201
  end

  def statistics
    # Returns to api caller statistics on all activities
    # as a JSON object defined in the respective RABL file
    @statistics = OpenStruct.new  
    @statistics.data = Activity.gen_statistics
    request.env['HTTP_ACCEPT_ENCODING'] = 'gzip'
    render 'api/v1/statistics' 
  end
  
  private
  def activity_params
    params.permit(:date, :distance, :duration, :comment)
  end
end

