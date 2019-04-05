class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweets
  belongs_to :tweet, optional: true

  has_many :likes, foreign_key: 'user', class_name: 'Like'
  # has_many :liked_users, foreign_key: 'user', class_name: 'Like'
  # has_many :users, through: :likes, class_name: 'User'
  has_many :users, through: :likes, class_name: 'User'

end
