class Adminuser

  include DataMapper::Resource
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable, :lockable, :validatable

  property :id, Serial
  property :name, String
  property :email, String, :format => :email_address

end
