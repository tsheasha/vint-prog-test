Rails.application.routes.draw do
  #Map root url to the index function of the ActivitiesController
  root 'activities#index'
    
  resources :activities do 
    collection do
        #Set Route for statistics  
        get 'statistics'
    end 
  end 
  namespace :api, :defaults => {:format => :json} do
    namespace :v1, constraints: ApiConstraints.new(version: 1, default: :true), :path => "" do
      resources :activities do
        collection do
          #Set Route for statistics  
          get 'statistics'
        end
      end 
    end
  end
end
