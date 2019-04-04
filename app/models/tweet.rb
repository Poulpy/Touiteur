class Tweet < ApplicationRecord
  belongs_to :user


  has_many :child_tweets, foreign_key: "parent_id", class_name: "Reply"
  has_many :childs, through: :child_tweets

  has_many :parent_tweets, foreign_key: "child_id", class_name: "Reply"
  has_many :parents, through: :parent_tweets

end
