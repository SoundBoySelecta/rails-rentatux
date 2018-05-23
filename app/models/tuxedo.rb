class Tuxedo < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  mount_uploader :picture, PhotoUploader
  validates :picture, presence: true
  validates :condition, presence: true, inclusion: { in: ["mint", "almost new", "slightly used", "used", "heavily used"] }
  validates :size, presence: true, inclusion: { in: ["big", "medium", "small"] }
end
