class AddUserCaloriesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_calories, :decimal, precision: 10, scale: 2
  end
end
