class Statistic
  include DataMapper::Resource
  
  property :id, Serial 
  property :attention, Integer, :default=>0                 # raw views, to be refined  
  property :nixcount, Integer, :default=>0                  # nix count
  property :firstlasttimeratio, Float
  property :mood_x, Integer, :default=>10
  property :mood_y, Integer, :default=>10
  belongs_to :shout

end

#mood
#     0 fashionable <-----------------------> unfashionable 10
#0
#attractive     1              2                3
# 
#
#               4              5                6
#
#
#              7                8               9
#unattractive
#10
