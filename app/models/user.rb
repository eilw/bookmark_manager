class User
  include DataMapper::Resource

  property :id,  Serial
  property :name, String
  property :email, String
  property :password_digest, BCryptHash

  def password=(password)
    pass = BCrypt::Password.create(password)
    self.password_digest = pass
  end
end
