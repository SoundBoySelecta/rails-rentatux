class AddPriceToTuxedos < ActiveRecord::Migration[5.2]
  def change
    add_column :tuxedos, :price, :integer
  end
end
