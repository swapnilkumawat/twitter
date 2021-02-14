class CommentsController < ApplicationController

  def create
    @tweet = Tweet.find_by(id: params[:id])
    @comment = @tweet.comments.new(comment_params)
    @comment.user = current_user
    unless @comment.save
      @error = @comment.errors.full_messages.first
    end
  end

  private

  def comment_params
    params.permit(:content)
  end

end
