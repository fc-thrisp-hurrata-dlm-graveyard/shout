require 'bcrypt'
class Shout
  include DataMapper::Resource
  include BCrypt
 
  property :id, Serial                                     # unique key
  property :istop, String                                  # is parent or child, we can eliminate this
  property :created_at, DateTime                           # created
  property :updated_at, DateTime                           # updated
  property :content, Text, :length => (1..140)             # content of post
  
  property :password, BCryptHash                           # trip code pass
  #property :trip, String                                   # trip for display    
  
  property :image, String, :auto_validation => false       # Carrierwave image info
 
  belongs_to :forum
  is :tree, :order => [:istop, :created_at]
  mount_uploader :image, ImageUploader

  #attr_accessor :password
 
  # hook after creation to format a whole object to send out 
  # memory? computation? as html?
  # e.g. shout.formatted as, json, html, xml etc.

  #after :save do
  #before :save

  after :create do

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password, :cost => 2)
    self.password = @password
  end
     
  def trip
    @trip = '!'<<self.password.to_str[20..33]
    self.trip = @trip
  end
  
  end

end

DataMapper.finalize
