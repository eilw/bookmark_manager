require 'data_mapper'
require 'dm-postgres-adapter'

class Link

  include DataMapper::Resource

  property :id, Serial
  property :url, String
  property :name, String

end

  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "postgres://localhost/bookmarks")
  DataMapper.finalize
  DataMapper.auto_upgrade!
