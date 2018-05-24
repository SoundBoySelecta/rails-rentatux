class Tuxedo < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  mount_uploader :picture, PhotoUploader
  validates :picture, presence: true
  validates :condition, presence: true, inclusion: { in: ["Mint", "Almost new", "Slightly used", "Used", "Heavily used"] }
  validates :size, presence: true, inclusion: { in: ["Big", "Medium", "Small"] }
  mount_uploader :picture, PictureUploader
end
