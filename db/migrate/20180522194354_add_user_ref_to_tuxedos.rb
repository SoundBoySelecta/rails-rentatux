class AddUserRefToTuxedos < ActiveRecord::Migration[5.2]
  def change
    add_reference :tuxedos, :user, foreign_key: true
  end
end
