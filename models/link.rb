
class Link

  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :url, String
  property :name, String

end
