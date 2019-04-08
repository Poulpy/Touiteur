class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweets
  belongs_to :tweet, optional: true

  has_many :likes, foreign_key: 'tweet_id', class_name: 'Like'
  has_many :users, through: :likes, class_name: 'User'

  # has_many :child_tweets, foreign_key: "parent_id", class_name: "Reply"
  # has_many :childs, through: :child_tweets

  # has_many :parent_tweets, foreign_key: "child_id", class_name: "Reply"
  # has_many :parents, through: :parent_tweets

end
