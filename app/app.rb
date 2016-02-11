ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/data_mapper_setup'
require 'bcrypt'

class BookmarkManager < Sinatra::Base
  include BCrypt
  enable :sessions

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @user = session[:user_name]
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

  get '/user/new' do
    erb :signup
  end

  post '/new-user' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_name] = params[:name]
    redirect '/links'
  end

  post '/links' do
    link = Link.create(:title => params[:title], :url => params[:url])
    params[:tag].split(',').each do |tag|
      tagg = Tag.create(tag: tag)
      link.tags << tagg
      link.save
    end
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
