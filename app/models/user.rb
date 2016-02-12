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

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_digest = @password
  end

  def authenticate(password)
    self.id if self.password == password
  end

  def forgot_password
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    self.password = random_password
    self.save!
    #Mailer.create_and_deliver_password_change(self, random_password)
  end

end
