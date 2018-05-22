class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :status, default: "available"
      t.date :start_date
      t.date :end_date
      t.references :tuxedo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
