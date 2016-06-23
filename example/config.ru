require 'bundler/setup'
require 'omniauth-strava'
require './app.rb'

use Rack::Session::Cookie, :secret => 'abc123'

use OmniAuth::Builder do
  provider :strava, ENV['APP_ID'], ENV['APP_SECRET'], :scope => 'public'
end

# ENV['APP_TOKEN'] ="d6d3c5bab1694c4c8412294d529d523ab43a7059"
# ENV['APP_SECRET']="b48b5dbd9351f67b063708fe24989f0032cbc453"
# ENV['APP_ID']    ="12159"

run Sinatra::Application
