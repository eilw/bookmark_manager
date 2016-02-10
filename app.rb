ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  get '/tags/:tag' do
    @tag = params[:tag]
    @links = Tag.all(tag: @tag).links
    erb :tags
  end

  post '/links' do
    link = Link.create(:title => params[:title], :url => params[:url])
    tag = Tag.create(:tag => params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
