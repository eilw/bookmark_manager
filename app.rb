ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Bookmarks < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user || User.get(session[:user_id])
    end
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.new(url: params[:url], name: params[:name])
    params[:tags].split(' ').each do |tag|
      link.tags << Tag.first_or_create(name: (tag.capitalize))
    end
    link.save
    redirect('/links')
  end

  #Saved in order to remember what created the bug
  # @links = Link.all(:tags=>[{:name => 'bubbles'}])

  get '/tags/:name' do
    @links = Link.all(Link.tags.name => params[:name])
    erb :'links/index'
  end

  get '/signup' do
    @user = User.new
    erb :sign_up
  end

  post '/signup' do
      @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.valid?
        session[:user_id] = @user.id
        redirect('/links')
      else
        flash.now[:blah] = "Check your login details"
        erb :sign_up
      end
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
