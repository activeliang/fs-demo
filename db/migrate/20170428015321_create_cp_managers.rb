class CreateCpManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :cp_managers do |t|
      t.string :name
      t.string :manager_image
      t.string :post
      t.text :description
      t.string :website
      t.integer :job_id
      t.timestamps
    end
  end
end
