class API::V1::ActivitiesController < ApplicationController

  def index
    @activities = Activity.list_activities(params)
    request.env['HTTP_ACCEPT_ENCODING'] = 'gzip'
    render 'api/v1/index'
  end

  def create
    ActivitiesHelper.clean_params(params)
    Activity.create!(activity_params)
    request.env['HTTP_ACCEPT_ENCODING'] = 'gzip'         
    msg = { :status => "OK", :message => "Success!"}
    render :json => msg, :status => 200
  end

  def statistics
    @statistics = OpenStruct.new  
    @statistics.data = Activity.gen_statistics
    request.env['HTTP_ACCEPT_ENCODING'] = 'gzip'
    render 'api/v1/statistics' 
  end
  
  private
  def activity_params
    params.permit(:date, :distance, :duration, :comment)
  end

  def send_415
    @msg = { :http_code => "415",  \
        :message => "Unsupported Media Type, plase specify JSON" + \
            " or XML in the header of your request"}
  end
end

