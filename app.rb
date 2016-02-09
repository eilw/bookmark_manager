require 'sinatra/base'
require './models/link'
require './models/tag'


class Bookmarks < Sinatra::Base
  ENV["RACK_ENV"] ||= "development"


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
    tag = Tag.create(tag: params[:tag])
    Link.create(url: url, name: name, tag: tag.tag)
    redirect('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
