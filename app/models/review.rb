class Review < ApplicationRecord
  belongs_to :user_id
  belongs_to :event_id
  belongs_to :reviewed_id
end
