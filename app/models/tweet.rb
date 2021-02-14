class Tweet < ApplicationRecord

  validates :content, presence: true, length: { maximum: 300, minimum: 10 }

  belongs_to :user

  belongs_to :parent, class_name: 'Tweet', optional: true
  
  has_many :retweets, foreign_key: :parent_id, class_name: 'Tweet'

  has_many :comments

  has_many :likes

  def retweeter_name
    if parent_id?
      user.name
    end
  end

end
