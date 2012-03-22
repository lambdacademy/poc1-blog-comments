require "rubygems"
#require "bundler/setup"

require 'sinatra'
require 'sinatra/jsonp'

set :port, 22785
disable :logging

def require_bundle(&block)
    bundle_msg = `cd .. && bundle check --no-color 2>&1`
    puts "bundle_msg = #{ bundle_msg }"
    if $?.exitstatus == 0
        block.call
    else
        return :errors => { :bundle => bundle_msg }
    end
end

get '/' do
    "Success!"
end

get '/alive' do
    JSONP :alive => true
end

get '/uid' do
    re = /.*http:\/\/([^\/]*)\/([^\/]*).*/
    m = re.match `cd .. && git remote show -n origin | grep 'Fetch URL'`
    JSONP m[2]
end

get '/bundle/check' do
    result = require_bundle do
        { :success => true }
    end

    JSONP result
end

get '/check/:code' do
    result = require_bundle do
        if /^[a-z0-9_-]/i =~ params[:code]
            r = `cd .. && rake "lambda:check[#{ params[:code] }]" 2>&1`
            d = { :success => true, :result => r, :exitstatus => $?.exitstatus }
            next d
        end
    end

    JSONP result
end

