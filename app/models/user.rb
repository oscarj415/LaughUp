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

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
