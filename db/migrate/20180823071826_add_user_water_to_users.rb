class AddUserWaterToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_water, :decimal, precision: 10, scale: 2
  end
end
