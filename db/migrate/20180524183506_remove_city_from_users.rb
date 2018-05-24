class RemoveCityFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :city, :string
    remove_column :users, :country, :string
  end
end
