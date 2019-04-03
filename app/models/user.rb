class User < ApplicationRecord
    has_many :followers_subscriptions, foreign_key: "followed_id", class_name: "Subscription"
    has_many :followers, through: :followers_subscriptions

    has_many :followeds_subscriptions, foreign_key: "follower_id", class_name: "Subscription"
    has_many :followeds, through: :followeds_subscriptions



    def unfollowed
        User.find(User.all.ids - self.followeds.ids)
    end

    def tweets_of_followeds
        self.followeds.ids.each do |f|
            t = Tweet.where(user_id: i).first
            yield(t)
        end
    end


end