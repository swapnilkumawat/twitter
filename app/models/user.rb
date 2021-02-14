class User < ApplicationRecord

  has_secure_password
  validates :username, presence: true, uniqueness: true, length: { maximum: 20, minimum: 3 }
  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, presence: true
  validates :password_confirmation, length: { minimum: 6 }, presence: true

  has_many :tweets

  has_many :comments

  has_many :likes

  def likes?(tweet)
    tweet.likes.active.where(user_id: id).exists?
  end

  def retweets
    tweets.where.not(parent_id: nil)
  end

  def retweeted?(tweet)
    retweets.where(parent_id: tweet.id).exists?
  end

end
