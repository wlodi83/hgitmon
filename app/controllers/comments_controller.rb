class CommentsController < ApplicationController
  def create
    @girl = Girl.find(params[:girl_id])
    @comment = @girl.comments.create(params[:comment])
    redirect_to girl_path(@girl)
  end
end
