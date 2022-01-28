require 'sinatra/base'
require 'sinatra/reloader'

class TvManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :homepage
  end

  run! if app_file == $0
end
