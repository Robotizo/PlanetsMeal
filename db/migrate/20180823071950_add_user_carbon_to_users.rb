class AddUserCarbonToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_carbon, :decimal, precision: 10, scale: 2
  end
end
