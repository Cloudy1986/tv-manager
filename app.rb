require 'sinatra/base'
require 'sinatra/reloader'
require './lib/show'

class ShowManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :homepage
  end

  get '/tv-show-list' do
    @shows = Show.all
    p @shows
    erb :index
  end

  run! if app_file == $0
end
