require 'sinatra/base'
require_relative 'data_mapper_setup'

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
    link = Link.new(url: params[:url], name: params[:name])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
