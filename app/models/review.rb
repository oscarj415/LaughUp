class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :reviewed, class_name: "User"

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :content, presence: true
  validates :user_type, presence: true
end
