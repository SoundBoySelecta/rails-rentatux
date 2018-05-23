class Booking < ApplicationRecord
  belongs_to :tuxedo
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: ["pending", "approved", "denied"] }
end

# , uniqueness: { scope: :tuxedo_id }
