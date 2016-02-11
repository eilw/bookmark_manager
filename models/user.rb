require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, Text
  property :email, Text, :required => true
  property :password_hash, Text
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => 'Passwords do not match'
  validates_presence_of :email, :message => 'Please provide an email address'
  validates_uniqueness_of :email, :message => 'User already exists'
  validates_format_of :email, as: :email_address, :message => 'Please provide a correct email address'

  #regex to compare the email: :with => /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,3}$/


  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end
  #
  # def login
  #   @user = User.find_by_email(params[:email])
  #   if @user.password == params[:password]
  #     give_token
  #   else
  #     redirect_to home_url
  #   end
  # end
  #
  # # assign them a random one and mail it to them, asking them to change it
  # def forgot_password
  #   @user = User.find_by_email(params[:email])
  #   random_password = Array.new(10).map { (65 + rand(58)).chr }.join
  #   @user.password = random_password
  #   @user.save!
  #   Mailer.create_and_deliver_password_change(@user, random_password)
  # end

end
