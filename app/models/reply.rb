class Reply < ApplicationRecord
  belongs_to :parent_tweet, class_name: "Tweet", optional: true
  belongs_to :child_tweet, class_name: "Tweet", optional: true
end
