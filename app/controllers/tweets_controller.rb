class TweetsController < ApplicationController

  def index
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    unless @tweet.save
      @error = @tweet.errors.full_messages.first
    end
  end

  private

  def tweet_params
    params.permit(:content)
  end

end
