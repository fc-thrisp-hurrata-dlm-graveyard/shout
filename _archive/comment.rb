class Comment
   include DataMapper::Resource

    property :id, Serial                                  # unique key
    property :a_comment, Text, :length => (1..140)        # comment content
    property :created_at, DateTime                        # created

    property :image, String, :auto_validation => false    # Carrierwave image info

    belongs_to :shout
    #has n, :images
    mount_uploader :image, ImageUploader                              
end

DataMapper.finalize
