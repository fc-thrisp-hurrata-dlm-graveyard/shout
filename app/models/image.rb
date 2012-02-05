class Image

  include DataMapper::Resource

  property :id, Serial
  property :randomstring, String
  property :created_at, DateTime                            # created

  belongs_to :shout

  property :image, String, :auto_validation => false        # Carrierwave image info
  mount_uploader :image, ImageUploader                      # Carrierwave uploader

  def newname
    self.randomstring = Digest::SHA1.hexdigest([Time.zone.now.utc, rand].join)
    self.randomstring = self.id.to_i+100000
  end

  after :create do
    newname
  end

end
