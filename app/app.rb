ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'bcrypt'

require_relative 'models/data_mapper_setup'
require_relative 'helpers/current_user_helper'


class BookmarkManager < Sinatra::Base
  include CurrentUser
  include BCrypt
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

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

  get '/users' do
    erb :signup
  end

  post '/users' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.valid?
      redirect '/links'
    else
      flash[:notice] = user.errors.full_messages
      redirect '/users'
    end
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

  get '/users/login' do
    erb :login
  end

  post '/users/login' do
    user = User.first(email: params[:email])
    session[:user_id] = user.authenticate(params[:password]) if user
    if session[:user_id]
      redirect('/links')
    else
      redirect('/users/login')
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
