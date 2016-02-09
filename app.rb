require 'sinatra/base'
require './models/link'


class Bookmarks < Sinatra::Base

  get '/' do
    @link = Link.new(url: "http://www.google.com", name: "Google")
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
