class AddUserProteinsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_proteins, :decimal, precision: 10, scale: 2
  end
end
