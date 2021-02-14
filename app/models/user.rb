class User < ApplicationRecord

  has_secure_password
  validates :username, presence: true, uniqueness: true, length: { maximum: 20, minimum: 3 }
  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  validates :password, length: { minimum: 6 }, presence: true

  has_many :tweets

  has_many :comments

  has_many :likes

  def likes?(tweet)
    tweet.likes.active.where(user_id: id).exists?
  end

end
