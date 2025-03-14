class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum user_type: {
    fan: 0,
    comedian: 1,
    venue: 2
  }

  has_many :events_as_comedian, class_name: "Event", foreign_key: "comedian_id", dependent: :destroy
  has_many :events_as_venue, class_name: "Event", foreign_key: "venue_id", dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # All users
  validates :user_name, presence: true
  validates :user_type, presence: true

  # Comedian & Venue
  validates :description, presence: true, if: -> { comedian? || venue? }

  # Venue
  validates :address, presence: true, if: :venue?
  # validates :longitude, presence: true, if: :venue?
  # validates :latitude, presence: true, if: :venue?

  has_many :reviews, dependent: :destroy
  has_many :received_reviews, class_name: "Review", foreign_key: "reviewed_id", dependent: :destroy
end
