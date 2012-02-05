class Picture
  include DataMapper::Resource

  property :id, Serial                                   # unique key
  property :created_at, DateTime                         # created
  property :updated_at, DateTime                         # updated
  
  property :image, String, :auto_validation => false     # Carrierwave image info

  belongs_to :shout
  belongs_to :comment
  
  has_tags_on :tags
  
  mount_uploader :image, ImageUploader

end

DataMapper.finalize
