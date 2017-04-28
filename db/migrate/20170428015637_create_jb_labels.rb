class CreateJbLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :jb_labels do |t|
      t.integer :job_id
      t.string :label_item
      t.boolean :is_of_product, default: false
      t.boolean :is_of_company, default: false
      t.timestamps
    end
  end
end
