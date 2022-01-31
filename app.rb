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
    erb :index
  end

  get '/tv-show-list/new' do
    erb :new
  end

  post '/tv-show-list' do
    Show.create(title: params['title'])
    redirect '/tv-show-list'
  end

  run! if app_file == $0
end
