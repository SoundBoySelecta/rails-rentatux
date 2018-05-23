class Tuxedo < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :picture, presence: true
  validates :condition, presence: true, inclusion: { in: ["mint", "almost new", "slightly used", "used", "heavily used"] }
  validates :size, presence: true, inclusion: { in: ["big", "medium", "small"] }
  mount_uploader :picture, PictureUploader
end
