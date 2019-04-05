class Tweet < ApplicationRecord
  belongs_to :user

  has_many :tweets
  belongs_to :tweet, optional: true

  Gutentag::ActiveRecord.call self

end
