class Event < ApplicationRecord
  belongs_to :comedian, class_name: "User"
  belongs_to :venue, class_name: "User"
  has_many :reviews, dependent: :destroy
  has_many :interests, dependent: :destroy

  validates :comedian_id, presence: true
  validates :venue_id, presence: true

  validate :comedian_must_exist
  validate :venue_must_exist

  private

  def comedian_must_exist
    unless User.exists?(id: comedian_id, user_type: "comedian")
      errors.add(:comedian_id, "must be a valid comedian")
    end
  end

  def venue_must_exist
    unless User.exists?(id: venue_id, user_type: "venue")
      errors.add(:venue_id, "must be a valid venue")
    end
  end
end
