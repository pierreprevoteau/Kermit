# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Resque.configure do |config|

  # Set the redis connection. Takes any of:
  #   String - a redis url string (e.g., 'redis://host:port')
  #   String - 'hostname:port[:db][/namespace]'
  #   Redis - a redis connection that will be namespaced :resque
  #   Redis::Namespace - a namespaced redis connection that will be used as-is
  #   Redis::Distributed - a distributed redis connection that will be used as-is
  #   Hash - a redis connection hash (e.g. {:host => 'localhost', :port => 6379, :db => 0})
  config.redis = 'redis://192.168.99.100:32768'

end