require 'sinatra/base'
require './models/link'


class Bookmarks < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    url = params[:url]
    name = params[:name]
    Link.create(url: url, name: name)
    redirect('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
