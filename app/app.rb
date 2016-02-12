ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'bcrypt'
require 'sinatra/partial'

require_relative './controllers/init'
require_relative 'models/data_mapper_setup'
require_relative 'helpers/current_user_helper'


class BookmarkManager < Sinatra::Base
  include CurrentUser
  include BCrypt
  register Sinatra::Partial

  register Sinatra::Flash
  enable :sessions

  enable :partial_underscores


  set :partial_template_engine, :erb
  set :session_secret, 'super secret'
  set :method_override, true
  set :views, Proc.new { File.join(root, "../views") }


  get '/' do
    redirect '/links'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
