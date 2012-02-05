class TestShout
  include DataMapper::Resource

  property :id, Serial                                    # unique key
  property :istop, String                                 # parent_id
  property :created_at, DateTime                          # created
  property :updated_at, DateTime                          # updated
  property :content, Text, :length => (1..140)            # content of post
  
  is :tree, :order => [:istop, :created_at]

end
