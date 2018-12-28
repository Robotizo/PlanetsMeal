class ChangeCaloriesInProducts < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :calories, :decimal, :precision => 10, :scale => 2
  end
end
