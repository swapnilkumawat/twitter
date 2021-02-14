class LikesController < ApplicationController

  def create
    @tweets = Tweet.includes(:user).order(updated_at: :desc)
    @tweet = Tweet.find_by(id: params[:id])
    @like = @tweet.likes.find_or_initialize_by(user_id: current_user.id)
    @like.active? ? @like.active = false : @like.active = true
    @like.save
  end

end
