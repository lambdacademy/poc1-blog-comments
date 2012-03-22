require "rubygems"
#require "bundler/setup"

require 'sinatra'
require 'sinatra/jsonp'

set :port, 22785

def require_bundle(&block)
    bundle_msg = `cd .. && bundle check`
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
    require_bundle do
        JSONP :success => true
    end
end

get '/check/:code' do
    result = require_bundle do
        if /^[a-z0-9_-]/i =~ params[:code]
            return :success => true, :result => `cd .. && rake lambda:check[#{ params[:code] }]`
        end
    end

    JSONP result
end

