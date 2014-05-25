Rails.application.routes.draw do

  #Set Route for listing acitvities function of ActivityController
  get 'activity/list_all'
  #Set Route for statistics on activities function of ActivityController
  get 'activity/statistics'
  #Set Route to add new activity function of ActivityController
  post 'activity/register'
  #Map root url to the index function of the ActivityController
  get '/' => 'activity#index', :as => 'index'
end
