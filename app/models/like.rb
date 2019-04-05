class Like < ApplicationRecord
  belongs_to :tweet, class_name: "Tweet"
  belongs_to :user, class_name: "User"
end
