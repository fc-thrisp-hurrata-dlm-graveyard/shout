class ShoutsController < ApplicationController
  before_filter :get_shout
  respond_to :html, :json

  # GET /shouts/:id
  def show
    @shout.stat_hit
    respond_with (@shout)
  end


  # POST /shouts
  def create
 
    if @posttimecompare > 20 || session[:post_count] < 25
      @forum = Forum.get(params[:forum_id])
      @shout = Shout.create(params[:shout])
      
      @shout.sesskey = session[:session_id]
      
      session[:time_post] = Time.now.to_f
      session[:post_count] = session[:post_count].to_i + 1
     
      if @shout.save
        redirect_to(forum_path(@shout.forum_name), :notice => 'Shout was successfully created.')
      else
        redirect_to(forum_path(@shout), :notice => 'There was an error in posting') 
      end
    
    else
    
      redirect_to(root_path, :notice => 'Chill Out.')
  
    end
 
  end


  # DELETE /shouts/:id
  #-------------------

  def destroy
    @shout.destroy
    redirect_to(root_url)
  end

  # nix count /shouts/:id/nix
  #--------------------------

  def nix
    @shout.stat_nix
    redirect_to shout_path(@shout)
  end

  # nix count /shouts/:id/mood
  #---------------------------
  
  def mood
  end

private 

  def get_shout
    @shout = Shout.get(params[:id])
  end


end
