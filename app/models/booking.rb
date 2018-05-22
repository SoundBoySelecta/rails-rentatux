class Booking < ApplicationRecord
  belongs_to :tuxedo
  belongs_to :user
  validates start_date: presence: true, uniqueness: { scope: :tuxedo_id }
  validates end_date: presence: true
  validates status: presence: true
end
