ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require "bcrypt"

class Bookmarks < Sinatra::Base
  enable :sessions
  set :sessions, true

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

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.new(name: params[:name], email: params[:email])
    session[:password_hash] = BCrypt::Password.create(params[:password])
    @user.password = session[:password_hash]
    @user.save!
    redirect('/sign_up/welcome')
  end

  get '/sign_up/welcome' do
    @user = User.last
    erb :welcome
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
