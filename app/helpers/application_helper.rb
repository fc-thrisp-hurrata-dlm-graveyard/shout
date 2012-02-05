module ApplicationHelper

  def menuall
    #x = @thisshoutchan.boardnumber
    @menu = Forum.all(:visibility=>"visible", :limit=>20 )
  end


end
