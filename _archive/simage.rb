class Simage

  include DataMapper::Resource

  property :id, Serial
  #property :randomstring, String
  property :created_at, DateTime                            # created

  belongs_to :shout

  property :image, String, :auto_validation => false        # Carrierwave image info
  mount_uploader :image, ImageUploader                      # Carrierwave uploader


  #after :create, :newname
  #
  #  def newname
  #    #randomstring
  #    self.randomstring = Digest::SHA1.hexdigest([Time.zone.now.utc, rand].join)
  #    #serial id tied to model
  #    #self.randomstring = self.id.to_i+100000
  #  end

end
