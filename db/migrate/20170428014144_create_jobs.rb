class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :department
      t.integer :wage_upper_bound
      t.integer :wage_lower_bound
      t.boolean :is_fulltime, default: true
      t.text :temptation
      t.text :task
      t.text :claim
      t.boolean :is_show, default: false
      t.string :cp_image
      t.string :cp_name
      t.string :cp_subtitle
      t.integer :quantity
      t.string :cp_type
      t.string :cp_stage
      t.integer :cp_number
      t.string :cp_city
      t.text :cp_description
      t.string :cp_lng
      t.string :cp_lat
      t.string :cp_website
      t.timestamps
    end
  end
end
