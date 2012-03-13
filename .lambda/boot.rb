require "rubygems"
#require "bundler/setup"

require 'sinatra'

set :port, 22785

get '/' do
    "Success!"
end

get '/alive' do
    "true"
end

get '/bundle/check' do
    `bundle --gemfile=../Gemfile check`
end

