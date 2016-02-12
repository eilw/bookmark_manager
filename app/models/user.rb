require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,  Serial
  property :name, String
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, BCryptHash

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_digest = @password
  end
end
