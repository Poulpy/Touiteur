class User < ApplicationRecord
  rolify

  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers_subscriptions, foreign_key: "followed_id", class_name: "Subscription"
  has_many :followers, through: :followers_subscriptions

  has_many :followeds_subscriptions, foreign_key: "follower_id", class_name: "Subscription"
  has_many :followeds, through: :followeds_subscriptions

  has_one_attached :avatar

  has_many :likes
  has_many :tweets, through: :likes

  accepts_nested_attributes_for :tweets, allow_destroy: true


  # add a default role to a user just created
  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  def unfollowed
    User.find(User.all.ids - self.followeds.ids)
  end

  def tweets_of_followeds
    self.followeds.ids.each do |f|
      t = Tweet.where(user_id: i).first
      yield(t)
    end
  end

  def is_following? user
    self.followeds.include? user
  end

end
