class TripcodeController < ApplicationController
  #GET /tripcode
  def index
    
    @tripcodelist = Tripcode.all(:order=>[:id], :limit => 50)
    
    respond_to do |format|
      format.html
    end
  end

  def create  

    @tripcode = Tripcode.create(params[:tripcode])

    respond_to do |format|
      if @tripcode.save
        format.html { redirect_to(tripcode_index_path, :notice => 'Success') }
      else
        format.html { redirect_to(tripcode_index_path, :notice => 'Failllyer') }
      end
    end
  end

  def new
    @tripcode = Tripcode.new
  
    respond_to do |format|
      format.html
    end
  end

end
