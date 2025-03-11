class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :reviewed, class_name: "User"
end
