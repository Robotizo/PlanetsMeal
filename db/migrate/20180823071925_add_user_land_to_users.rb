class AddUserLandToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_land, :decimal, precision: 10, scale: 2
  end
end
