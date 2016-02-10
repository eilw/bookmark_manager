ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmarks < Sinatra::Base



  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.new(url: params[:url], name: params[:name])
    tag_input = params[:tags].split(' ')
    tag_input.each do |tag|
      tag = Tag.first_or_create(name: (tag.capitalize))
      link.tags << tag
    end
    link.save
    redirect('/links')
  end

  #Saved in order to remember what created the bug
  # @links = Link.all(:tags=>[{:name => 'bubbles'}])

  get '/tags/:name' do
    @links = Link.all(Link.tags.name => params[:name])
    erb :bubbles
  end

  #An altnerative way of doing it by identifying the tag first.
  # get '/tags/:name' do
  #   tag = Tag.first(name: params[:name])
  #   @links = tag ? tag.links : []
  #   erb :bubbles
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
