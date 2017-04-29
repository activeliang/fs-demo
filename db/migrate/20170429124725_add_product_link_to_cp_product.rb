class AddProductLinkToCpProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :cp_products, :product_link, :string
  end
end
