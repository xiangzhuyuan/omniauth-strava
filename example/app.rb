require 'sinatra'
require "sinatra/reloader"
require 'yaml'

# configure sinatra
set :run, false
set :raise_errors, true

# setup logging to file
log = File.new("app.log", "a+")
$stdout.reopen(log)
$stderr.reopen(log)
$stderr.sync = true
$stdout.sync = true

# server-side flow
get '/' do
  redirect '/auth/strava'
end

get 'auth/:provider' do

end

get '/auth/:provider/callback' do
  content_type 'application/json'
  MultiJson.encode(request.env['omniauth.auth'])
end

get '/auth/failure' do
  content_type 'application/json'
  MultiJson.encode(request.env)
end
