require 'base64'
class Tripcode
  include DataMapper::Resource
  #include BCrypt

  property :id, Serial
  property :thistrip, String, :auto_validation => false
  property :password_hash, String, :auto_validation => false

  attr_accessor :password
 
  before :save, :createtripcode

  def password
    #@password ||= Password.new(self.password_hash)
    @password ||= self.password_hash
  end

  def password=(new_password)
    #@password = Password.create(new_password, :cost => 1)
    @password = Base64.encode64(Digest::MD5.hexdigest(new_password))
    self.password_hash = @password
  end
  
  def createtripcode
    self.thistrip = '!'<<self.password_hash.to_str[30..40]
    @thistrip = self.thistrip
  end

end
