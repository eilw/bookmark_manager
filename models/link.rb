require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class Link

  include DataMapper::Resource

  property :id, Serial
  property :url, String
  property :name, String
  property :tag, String

end

db_setup
