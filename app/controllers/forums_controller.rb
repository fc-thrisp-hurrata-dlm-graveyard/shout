class ForumsController < ApplicationController

  # GET /forums/:id
  #----------------
  def show

    @forum = Forum.get(params[:id])
    @shouts = @forum.shouts(:order=>[:updated_at.desc], :parent_id => nil)
    
    if @shouts
      @shouts = @shouts.paginate :per_page => 10,
        :page => params[:page],
        :order => 'updated_at DESC'
    end

    respond_to do |format|
      format.html
    end

  end

end
