class CreateProductLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :product_labels do |t|
      t.integer :cp_product_id
      t.string :label_item
      t.timestamps
    end
  end
end
