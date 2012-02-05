class Admin::ForumsController < ApplicationController
  # GET /admin/forums
  def index
    @forums = Forum.all

    respond_to do |format|
      format.html
    end
  end

  # GET /admin/forums/:id
  def show
    @menu = Forum.all
    @forum = Forum.get(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /admin/forums/new
  def new
    @forum = Forum.new

    respond_to do |format|
      format.html
    end
  end

  # GET /admin/forums/:id/edit
  def edit
    @forum = Forum.get(params[:id])
  end

  # POST /forums
  def create
    @forum = Forum.new(params[:forum])
  
    respond_to do |format|
      if @forum.save
        format.html { redirect_to(admin_forums_path, :notice => 'Forum was successfully created.') }
      else
        format.html { render :action => "new" }
      end
   end
  end

  # PUT /forums/1
  def update
    @forum = Forum.get(params[:id])
  
    respond_to do |format|
      if @forum.update(params[:forum])
        format.html { redirect_to(admin_forums_path, :notice => 'Forum was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /forums/:id
  def destroy
    @forum = Forum.get(params[:id])
    @forum.destroy
 
  
    respond_to do |format|
      format.html { redirect_to(admin_forums_path) }
    end
  end
end
