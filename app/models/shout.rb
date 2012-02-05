class Shout
  include DataMapper::Resource
 
  property :id, Serial                                      # unique key
  property :randomstring, String                            # random string for image filename
  property :created_at, DateTime                            # created
  property :updated_at, DateTime                            # updated
  property :title, Text, :length => (0..30)                 # title/label shout
  property :content, Text, :length => (2..5000)             # content of shout
  property :thistoken, String                               # tripcode token, not secure in any dimension
  property :password_hash, String                           # tripcode original hash 
  property :sesskey, String                                 # session key
  
  property :image, String, :auto_validation => false        # Carrierwave image info
  mount_uploader :image, ImageUploader                      # Carrierwave uploader

  belongs_to :forum                                         # must belong to a forum
  has 1, :statistic

  #has n, :images                                           # contains a number of images 
  #accepts_nested_attributes_for :images                    # dm-accepts_nested_attributes

  is :tree, :order => [:created_at]                         # dm-is-tree, order by
  
  attr_accessor :password#, :simages, :simages_attributes                       
 
  if :password #seems messier than it could be, but appears to work
 
    def password
      @password ||= self.password_hash
    end

    def password=(new_password)
      @password = Base64.encode64(Digest::MD5.hexdigest(new_password)) unless new_password.empty?
      self.password_hash = @password
    end
    
    after :save, :createtoken

    def createtoken
      if self.password_hash
        self.thistoken = '!' << self.password_hash.to_str[20..33]
        @thistoken = self.thistoken
      end
    end

  end

  def blurbchildren
    self.children(:order=>[:created_at.asc]).last(3)
  end

  def newname
    self.randomstring = Digest::SHA1.hexdigest([Time.zone.now.utc, rand].join)
  end

  def firstlasttimeratio
    unless self.children.nil?
      self.created_at.to_f / self.children.last.created_at.to_f
    end
  end

  def stat_hit
    self.statistic.update(:attention=>@shout.statistic.attention+1)
  end

  def stat_nix
    self.statistic.update(:nixcount=>@shout.nixcount+1)
  end

  def stat_mood
  end

  after :create do 

    newname

    if self.parent.nil?
      Statistic.create(:shout_id => self.id)
    else
      self.parent.update(:updated_at=>Time.now)
    end

  end
  
end
