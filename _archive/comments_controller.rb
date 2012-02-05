class CommentsController < ApplicationController

  def create
    @shout = Shout.get(params[:shout_id])
    @comment = @shout.comments.create(params[:comment])
    @shout.update(:updated_at=>Time.now)
    redirect_to :back
  end

end
