class Event < ApplicationRecord
  belongs_to :comedian_id
  belongs_to :venue_id
end
