class AddProteinsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :proteins, :decimal, precision: 10, scale: 2
  end
end
