class Event < ApplicationRecord
  belongs_to :comedian, class_name: "User"
  belongs_to :venue, class_name: "User"
end
