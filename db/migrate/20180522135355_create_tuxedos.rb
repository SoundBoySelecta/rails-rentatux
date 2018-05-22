class CreateTuxedos < ActiveRecord::Migration[5.2]
  def change
    create_table :tuxedos do |t|
      t.string :color
      t.string :style
      t.string :condition
      t.string :size
      t.integer :year
      t.string :picture

      refer

      t.timestamps
    end
  end
end
