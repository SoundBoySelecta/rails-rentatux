class Tuxedo < ApplicationRecord
  belongs_to :user
  has_many :bookings dependent: :destroy
  validates :picture, presence: true
  validates :condition, presence: true
  validates :size, presence: true
end
