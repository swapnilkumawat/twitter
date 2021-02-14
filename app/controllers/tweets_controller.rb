class TweetsController < ApplicationController

  before_action :find_tweet, only: [:show, :retweet]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.includes(:user).order(updated_at: :desc)
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    unless @tweet.save
      @error = @tweet.errors.full_messages.first
    end
  end

  def show
    @comments = @tweet.comments.includes(:user)
  end

  def retweet
    @retweet = @tweet.retweets.find_or_initialize_by(user_id: current_user.id)
    if @retweet.persisted?
      @retweet.destroy
    else
      @retweet.content = @tweet.content
      @retweet.save
    end
  end

  private

  def find_tweet
    @tweet = Tweet.find_by(id: params[:id])
  end

  def tweet_params
    params.permit(:content)
  end

end
