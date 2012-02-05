class SiteController < ApplicationController
  def index
    @menu = Forum.all
    @shouts = Shout.all(:order=>[:updated_at.desc], :limit => 36) # where not expired

    respond_to do |format|
      format.html
    end
  end

end
