#Defines constraints for api request HTTP headers to follow
#API version must be mentioned in HTTP Accept Header
class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end
    
  def matches?(req)
    @default || req.headers['Accept'].include?("application/vint.api.v#{@version}")
  end
end
