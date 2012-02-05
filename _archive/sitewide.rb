#a place to stick some settings admin/application/site level settings
# probably need to connect with a rake task for initialization
#class Sitewide
#  include DataMapper::Resource

  #property :id, Serial                           # if other than 1, trouble
  #property :created_at, DateTime                 # created
  #property :updated_at, DateTime                 # updated
  #property :sitename, String                     # site name
  #property :firsttime, String                   # first time site has been run?
  #property :boardnumber, Integer, :default=>20  # number of boards

#end

#DataMapper.finalize
