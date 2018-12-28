class AddStoreTypeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :store_type, :string
  end
end
