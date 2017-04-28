class CreateCpProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cp_products do |t|
      t.string :product_image
      t.string :title
      t.text :description
      t.integer :job_id
      t.timestamps
    end
  end
end
