class Forum
  include DataMapper::Resource

  property :name, String, :key => true                      # name of forum
  property :description, Text                               # descriptipon of forum
  property :visibility, String, :default => "visible"       # forum is visible to all, or not (or something else tbd)
  property :frozen, String, :default => "unfrozen"          # freeze posting (stop form from going to client for now)
  
  has n, :shouts
 
  def shoutcount
    self.shouts.count
  end

end
