class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweets
  belongs_to :tweet, optional: true

  has_many :likes
  has_many :users, through: :likes

  has_one_attached :image

  Gutentag::ActiveRecord.call self

  def user_like(user)
    return Like.where(user_id: user.id, tweet_id: self.id).first
  end

  def child_tweets_count
    Tweet.where(tweet_id: self.id).count
  end
end
