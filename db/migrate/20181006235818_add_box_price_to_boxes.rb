class AddBoxPriceToBoxes < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :box_price, :decimal, precision: 10, scale: 2
  end
end
