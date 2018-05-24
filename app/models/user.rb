class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tuxedos, dependent: :destroy
  has_many :bookings, dependent: :destroy

  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

  # This way you can do current_user.bookings_on_my_vehicules
  has_many :bookings_on_my_tuxedos, through: :tuxedos, source: :bookings
end
